#!/bin/bash
set +x
cmnd=${1}
url=${2}

if [ "${cmnd}" == "build" ]
then
exec jekyll build

elif [ "${cmnd}" == "serve" ]
then
exec jekyll serve --watch --force_polling -H 0.0.0.0

elif [ "${cmnd}" == "check" ]
then
if [ "${url}" == "" ]
	then
	echo Provide URL to validate
else
exec linkchecker --check-css --check-html --complete --anchors --quiet -F=html/report/sit_repot.html ${url}
fi
else
exec	less -FX ./help.txt
fi
set -x
