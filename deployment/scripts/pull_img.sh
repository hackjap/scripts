# 빌드된 이미지 풀 받기 

#registry=harbor.okestro.cld/daegu-center
registry=harbor.okestro.cld/dream-markone
images="admin-app admin-api"
tag=latest

for i in $images
do
   docker pull $registry/$i:$tag
done 

docker images | grep $registry
