# 기존 이미지 삭제
$1=dream-markone

docker images | grep $1

docker rmi -f $(docker images | grep $1)


docker images | grep $1
