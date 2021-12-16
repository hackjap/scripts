# 배포된 이미지 풀 받기 

harbor=harbor.okestro.cld/daegu-center
images="admin-app admin-api"
tag=latest

for i in $images
do
   docker pull $harbor/$i:$tag
done 
