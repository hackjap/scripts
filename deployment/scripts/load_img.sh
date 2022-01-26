image=$(ls | grep tar )

for i in $image
do
  docker load -i $i
done	
