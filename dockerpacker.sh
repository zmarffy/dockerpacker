#!/bin/bash

mkdir -p ${HOME}/dockerpacker/images

if [ -z "$1" ]; then
   echo "No image provided"
   exit 1
fi

cd $1

imageName=$(python3 -c "import os; i = '${1}'; i = i[0:-1] if i.endswith(os.sep) else i; print(i.split(os.sep)[-1])")

oldID=$(docker inspect --format {{.Id}} ${imageName}_dopa)
docker build . -t "${imageName}_dopa"
newID=$(docker inspect --format {{.Id}} ${imageName}_dopa)

if [[ "$oldID" != "$newID" ]]; then
   docker image save "${imageName}_dopa" > ${HOME}/dockerpacker/images/${imageName}.tar
else
   echo "No change since last build"
fi
