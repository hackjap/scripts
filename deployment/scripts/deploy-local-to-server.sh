# Pull & Save 
REPO=harbor.okestro.cld/dream-markone
TAG=latest
TARGET='ubuntu@101.202.45.23:spjang'
DIR=$(date "+%Y-%m-%d"_deploy)
APPNAME=(admin-api admin-app)  
#APPNAME=(admin-api admin-app dashboard-api dashboard-app openstack-api openstack-app cloud-service-broker service-catalog-engine user-api user-app )
#APPNAME=(admin-api admin-app dashboard-api dashboard-app openstack-api openstack-app user-api user-app )


echo --- 1.배포용 디렉토리를 생성합니다... ---
mkdir $DIR && cd $_ && cp -r ../scripts . 
if [ $? -eq 0 ];then
    echo "생성 완료!"
else
    echo "중복된 디렉터리가 존재합니다!"
echo "$DIR 폴더를 삭제하시겠습니까?"
  select yn in "Yes" "No"; 
do
      case $yn in
          Yes ) ls; rm -rf $DIR; break;;
          No ) ls; echo $DIR 폴더를 삭제하시겠습니까?..; continue;;
      esac
done
fi



echo --- 2.docker build 도커 이미지를 생성합니다... ---
for i in "${APPNAME[@]}";
do
 echo $i pull ...
 docker pull $REPO/$i:$TAG 
 echo --- $i tar파일 생성중 ---
 docker save -o $i.tar $REPO/$i:latest
done

#echo --- 3.이미지를 삭제합니다.. --- 
#docker rmi -f $(docker images | grep $REPO)
#if [ $? -eq 0 ];then
#    echo "SUCCESS!"
#else
#    echo "삭제할 이미지가 존재하지 않습니다."
#fi
#

echo --- 4.배포 디렉토리를 타겟 서버에 전송합니다...  --- 
cd ..
pwd
scp -r $DIR $TARGET/
