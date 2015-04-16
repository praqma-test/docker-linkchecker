set -x
build_log_file=/tmp/docker_build$$.log
subworkdir="linkchecker"
#cache="--no-cache=true"
cache=""

dockerJekyllName="docker_jekyll"

dockerfile_image_path="/home/cls/gijeli/docker-linkchecker"

set +x
docker build ${cache} ${dockerfile_image_path} |  tee ${build_log_file}
set -x
image_no=`\
     grep "Successfully built " ${build_log_file} \
     | awk -F" " '{print $3}' `
rm -rf  ${build_log_file}

#sudo docker run \
docker run \
    --rm \
    -v $(pwd)/${subworkdir}:/${subworkdir} \
    ${image_no} \
    rm -rf linkchecker
docker run \
    --rm \
    -v $(pwd)/${subworkdir}:/${subworkdir} \
    --link ${dockerJekyllName}:${dockerJekyllName} \
    ${image_no} \
    linkchecker \
        --check-css \
        --check-html \
        --complete \
        --anchors \
        --quiet \
        -F=html/linkchecker.html \
        -F=csv/linkchecker.csv \
        -F=dot/linkchecker.dot \
        -F=gml/linkchecker.gml \
        -F=gxml/linkchecker.gxml \
        -F=text/linkchecker.txt \
        http://${dockerJekyllName}:4000 \
         --verbose
#        --check-extern \

set +x


