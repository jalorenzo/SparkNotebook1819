#/bin/bash

# Run with 'source run.sh' to keep it attached to the terminal

# It is not possible to copy some images to /zeppelin/webapps/webapp/assets/ in the zeppelin notebook because the /zeppelin/bin/zeppelin.sh file creates this  directory in booting time, erasing everything that it finds inside. So we need to build the container in background and then manually copy the images to the directory once it has been created by zeppelin.sh

# Build and boot the container in background
docker-compose up --build &

sleep 120

# Check that the directory has already been created
ASSETS="/zeppelin/webapps/webapp/assets"
READY=0

while [[ (-z "$READY") || ($READY != "1"* ) ]];
do
	READY=$(docker exec -it $(docker ps |grep zeppelin-notebook | cut -d" " -f1) bash -c "([ -d $ASSETS/images ] && echo 1)");
	sleep 5;
done

# Copy files
echo "Ready to copy images to the container..."
docker cp ./zeppelin-notebook/webapps/webapp/assets/images $(docker ps |grep zeppelin-notebook | cut -d' ' -f1):$ASSETS/ 

# Send the docker-compose job to foreground
fg
