#!/bin/bash
set +x
cmnd=$@
option=${1}
url=${2}

if [ "${option}" == "build" ]
then
exec jekyll build

elif [ "${option}" == "serve" ]
then

if [ "${url}" == "" ]
	then
exec jekyll serve --watch --force_polling -H 0.0.0.0
elif [ "${url}" == "check" ]
	then
jekyll serve --force_polling -B -H 0.0.0.0
echo ¤¤¤¤¤¤¤¤ Validating, be Patient ¤¤¤¤¤¤¤¤
linkchecker --check-css --check-html --complete --anchors --quiet -F=html/report/site_report.html http://0.0.0.0:4000
else
exec	less -rf -FX /help.txt
fi

elif [ "${option}" == "check" ]
then

if [ "${url}" == "" ]
	then
	echo Provide URL to Validate
else
	exec linkchecker --check-css --check-html --complete --anchors --quiet -F=html/report/site_report.html ${url}
fi

elif [ "${option}" == "jekyll" -o "${option}" == "linkchecker" ]
	then
exec ${cmnd}

else
exec	less -rf -FX /help.txt
fi
set -x
