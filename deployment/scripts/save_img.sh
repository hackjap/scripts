# Pull & Save 
repo=harbor.okestro.cld/dream-markone
tag=latest
appName=(admin-api)
#appName=(admin-api admin-app dashboard-api dashboard-app openstack-api openstack-app cloud-service-broker service-catalog-engine user-api user-app )
#appName=(admin-api admin-app dashboard-api dashboard-app openstack-api openstack-app user-api user-app )


echo --- 배포용 디렉토리를 생성합니다... ---
mkdir $(date "+%Y-%m-%d")_deploy && cd $_
cp ../scripts . 

echo --- docker build 도커 이미지를 생성합니다... ---
for i in $appName
do
 echo ${appName[$i]} pull ...
 docker pull $repo/${appName[$i]}:$tag 

 echo --- ${appName[$i]} tar파일 생성중 ---
 docker save -o ${appName[$i]}.tar $repo/${appName[$i]}:latest
done

echo --- 이미지 삭제 --- 
docker rmi -f $(docker images | grep $repo)
