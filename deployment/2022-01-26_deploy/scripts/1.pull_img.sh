# 빌드된 이미지 풀 받기 

#harbor=harbor.okestro.cld/daegu-center
harbor=harbor.okestro.cld/dream-markone
images="admin-app admin-api"
tag=latest

for i in $images
do
   docker pull $harbor/$i:$tag
done 

docker images | grep $harbor
