#! /bin/bash

# GOOGLE git repo downloads 


GIT_REPO_DOWNLOADS_URL="http://commondatastorage.googleapis.com/git-repo-downloads/repo"
# NXP repo configuration

NXP_MANIFEST_REPO="https://github.com/nxp-imx/imx-manifest"
VERSIONE="hardknott"
BRANCH_NXP_VERSIONE="imx-linux-${VERSIONE}"
MANIFEST_NXP="imx-5.10.35-2.0.0.xml"

# EGF repo configuration
PROGETTO="0700_vega_imx8_hardknott"
EGF_MANIFEST_REPO="git@gitrepo.egf.it:egf/meta-egf-manifest.git"
BRANCH_EGF_MANIFEST="0700_vega_imx8_hardknott"
MANIFEST_EGF="manifest.xml"

# EGF HTTP
FTP_URL="http://mantis.elettronicagf.it/Yocto/yocto/hardknott/yocto-input.tar.gz"


# DOCKER
DOCKER_IMAGE="egf-image-${VERSIONE}-${PROGETTO}:latest"


# FOLDERS BINDING
MNT_DIR=$(pwd | xargs  dirname )

OUTPUT_SRC=${MNT_DIR}/yocto-output
INPUT_SRC=${MNT_DIR}/yocto-input
DOWNLOADS_SRC=${MNT_DIR}/downloads

OUTPUT_DEST=/home/yocto/yocto-output
INPUT_DEST=/home/yocto/yocto-input
DOWNLOADS_DEST=/home/yocto/downloads


