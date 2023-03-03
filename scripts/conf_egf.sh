#! /bin/bash

# GOOGLE git repo downloads 

GIT_REPO_DOWNLOADS_URL="https://storage.googleapis.com/git-repo-downloads/repo-1"
# NXP repo configuration

NXP_MANIFEST_REPO="https://source.codeaurora.org/external/imx/imx-manifest"
VERSIONE="hardknott"
BRANCH_NXP_VERSIONE="imx-linux-${VERSIONE}"
MANIFEST_NXP="imx-5.10.35-2.0.0.xml"

# EGF repo configuration

PROGETTO="0789-ntam"
EGF_MANIFEST_REPO="git@gitrepo.egf.it:egf/meta-egf-manifest.git"
BRANCH_EGF_MANIFEST="0789_ntam8_imx8_hardknott"
MANIFEST_EGF="manifest.xml"

# EGF FTP
FTP_USER=""
FTP_PASS=""
FTP_URL="ftp://${FTP_USER}:${FTP_PASS}@ftp.elettronicagf.it:21/yocto/${VERSIONE}/${PROGETTO}/yocto-input.tar.gz"

# DOCKER
DOCKER_IMAGE="egf-image-yocto2-test-${VERSIONE}-${PROGETTO}:latest"

MNT_DIR=$(pwd | xargs  dirname )
PRG_DIR="/yocto2-nas/${VERSIONE}/${PROGETTO}_test"

OUTPUT_SRC=${MNT_DIR}/yocto-output
INPUT_SRC=${PRG_DIR}/yocto-input
DOWNLOADS_SRC=${PRG_DIR}/downloads

OUTPUT_DEST=/home/yocto/yocto-output
INPUT_DEST=/home/yocto/yocto-input
DOWNLOADS_DEST=/home/yocto/downloads