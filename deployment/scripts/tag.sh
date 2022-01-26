#!/bin/sh
tag=latest
registry=harbor.dreamcloud.co.kr 
project=dream-markone
image=$(docker images | grep $project | awk '{print $1}')

for i in $image
do
  app_name=${i#*$project/}
  docker tag $i $registry/$project/$app_name:$tag
done


#tag=latest
##registry=harbor.dreamcloud.co.kr 
#search=dreamcloud
#image=$(docker images | grep $search | awk '{print $1}')
#
#for i in $image
#do
#  docker push $i:$tag 
#done
