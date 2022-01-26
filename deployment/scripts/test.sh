image=harbor.okestro.cld/dream-markone/admin-api
project=dream-markone
get_image=${image#*$project/}

echo ${get_image}
