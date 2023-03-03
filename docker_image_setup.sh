#! /bin/bash

. ./scripts/conf_egf.sh

if [[ $1 == "--repo-setup" ]] ; then

	mkdir  $PRG_DIR &> /dev/null
	mkdir  $INPUT_SRC &> /dev/null
	mkdir  $DOWNLOADS_SRC &> /dev/null
	mkdir  $OUTPUT_SRC &> /dev/null
	source scripts/repo_setup.sh;
fi

CMD="docker build"
CMD+=' -f Dockerfile --build-arg "host_uid=$(id -u)" --build-arg "host_gid=$(id -g)" --tag "'
CMD+=$DOCKER_IMAGE
CMD+='" .'

eval $CMD



