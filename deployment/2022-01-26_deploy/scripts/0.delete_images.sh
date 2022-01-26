# 기존 이미지 삭제
project=dream-markone

docker images | grep $project

docker rmi -f $(docker images | grep $project)


docker images | grep $project
