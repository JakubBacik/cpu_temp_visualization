#! /bin/bash
echo "Executing CPU_TEMP_VISUALIZATION"

#Check if name of file was pass
if [ -x $1 ]
then
    echo "Error: name of file"
else
    echo "Name of file: $1"
    sudo docker build . -t $1
fi 

# find id of container
name_of_file=$(docker images | grep $1 | awk '{print $3}')

docker ps

docker run $name_of_file




