#! /bin/bash

# GOOGLE git repo downloads 

# GIT_REPO_DOWNLOADS_URL="https://storage.googleapis.com/git-repo-downloads/repo-1"

GIT_REPO_DOWNLOADS_URL="http://commondatastorage.googleapis.com/git-repo-downloads/repo"
# NXP repo configuration

NXP_MANIFEST_REPO="https://github.com/nxp-imx/imx-manifest"
VERSIONE="hardknott"
BRANCH_NXP_VERSIONE="imx-linux-${VERSIONE}"
MANIFEST_NXP="imx-5.10.35-2.0.0.xml"



# EGF repo configuration

PROGETTO="0800_egf_imx8_hardknott"
EGF_MANIFEST_REPO="git@gitrepo.egf.it:egf/meta-egf-manifest.git"
BRANCH_EGF_MANIFEST="0800_egf_imx8_hardknott"
MANIFEST_EGF="manifest.xml"

# EGF FTP
FTP_USER=""
FTP_PASS=""
FTP_URL="ftp://${FTP_USER}:${FTP_PASS}@ftp.elettronicagf.it:21/yocto/${VERSIONE}/egf_imx8_5.10.35_2.0.0/yocto-input.tar.gz"

# DOCKER
DOCKER_IMAGE="egf-image-${VERSIONE}-${PROGETTO}:latest"

MNT_DIR=$(pwd | xargs  dirname )
PRG_DIR="/yocto2-nas/${VERSIONE}/${PROGETTO}"

OUTPUT_SRC=${MNT_DIR}/yocto-output
INPUT_SRC=${PRG_DIR}/yocto-input
DOWNLOADS_SRC=${PRG_DIR}/downloads

OUTPUT_DEST=/home/yocto/yocto-output
INPUT_DEST=/home/yocto/yocto-input
DOWNLOADS_DEST=/home/yocto/downloads


