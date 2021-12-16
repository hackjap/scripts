# docker save

#app="userapp userapi openstackapi openstackapp service-catalog-engine dashboard-app dashboard-api adminapp adminapi "

app="admin-app admin-api"
repo="harbor.okestro.cld"
project="daegu-center"
tag="latest"


echo ---save img---

mkdir ./img-portal

for i in $app
do
    docker save -o ./img-portal/$i.tar $repo/$project/$i:$tag
done 
