#!/bin/bash
set -e

	echo "Unzipping data files"
	cd /data && ls *.tar.bz2 | xargs --verbose -i tar jxvf {}
	echo "Starting Zeppelin..."
	source /zeppelin/conf/zeppelin-env.sh

	/zeppelin/bin/zeppelin.sh 

exec "$@";
