#!bin/sh
#@author: spjang
#APP="admin-api admin-app cloud-service-broker dashboard-api dashboard-app openstack-api openstack-app service-catalog-engine user-api user-app"

# 변수
PROJECT=$1
APP="admin-app admin-api "
OLDREPO=harbor.okestro.cld
NEWREPO=harbor.dreamcloud.co.kr
TAG=latest

# 0.NULL 체크
if [ "$#" -eq 0 ]
then echo !! 프로젝트명을 입력해주세요...    ex\)dream-markone
  exit 1
fi

# 1.이미지 삭제
echo --- 기존 이미지를 삭제 합니다... ---
docker rmi -f $(docker images | grep $PROJECT)
if [ "$?" -eq 0 ];then
     echo "삭제 완료!"
else
   echo	"삭제할 이미지가 존재하지 않습니다"
fi

docker images | grep $PROJECT

# 2.이미지 load
echo ---  이미지를 로드합니다 ... ---
IMG_TARS=$(ls | grep tar )
for i in $IMG_TARS
do
  docker load -i $i
done

docker images | grep $OLDREPO

# 3.이미지 Tag
OLDIMG_NAME=$(docker images | grep $OLDREPO/$PROJECT | awk '{print $1}')
echo --- 이미지 명을 변경합니다 ... ---
for i in $OLDIMG_NAME
do
  APP_NAME=${i#*$PROJECT/}
  docker tag $i $NEWREPO/$PROJECT/$APP_NAME:$TAG
done
  docker images | grep $PROJECT

# 4.이미지 Push
echo --- 새로운 이미지를 푸시합니다... ---
NEWIMG_NAME=$(docker images | grep $NEWREPO/$PROJECT | awk '{print $1}')
docker login $NEWREPO -u admin -p dream123\!\@
for i in $NEWIMG_NAME
do
   docker push $i:$TAG
done
