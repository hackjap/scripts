repo=harbor.dreamcloud.co.kr
images $(docker images | grep $repo)

docker push $images


