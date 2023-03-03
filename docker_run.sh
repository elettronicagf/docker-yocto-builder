
#! /bin/bash

. ./scripts/conf_egf.sh

docker run -h dockerbuilder -it --rm \
--mount='type=bind,source='${OUTPUT_SRC}',target='${OUTPUT_DEST} \
--mount='type=bind,source='${INPUT_SRC}',target='${INPUT_DEST} \
--mount='type=bind,source='${DOWNLOADS_SRC}',target='${DOWNLOADS_DEST} $DOCKER_IMAGE
