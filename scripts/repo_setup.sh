#!/bin/bash


. scripts/conf_egf.sh

git config --global user.email yocto@androidbuilder
git config --global user.name yocto

if [ ! -f ~/bin/repo ]; then
    mkdir ~/bin 
    curl $GIT_REPO_DOWNLOADS_URL > ~/bin/repo
    chmod a+x ~/bin/repo
    export PATH=$PATH:~/bin
fi

cd $PRG_DIR

echo "Setup NXP repo"

# repo init -u $NXP_MANIFEST_REPO -b $BRANCH_NXP_VERSIONE -m $MANIFEST_NXP
# repo sync

wget $FTP_URL
tar xpvzf yocto-input.tar.gz 
rm yocto-input.tar.gz 

echo "Setup EGF repo"

mkdir tmp 
cd tmp

python3 ~/bin/repo init -u $EGF_MANIFEST_REPO -b  $BRANCH_EGF_MANIFEST -m $MANIFEST_EGF
repo sync

# Extrating Projects revision and starting local branch
B_ME=$(repo info -b meta-egf |grep "Manifest revision" | awk '{print $3}')
B_MEC=$(repo info -b meta-egf-common |grep "Manifest revision" | awk '{print $3}')
B_MER=$(repo info -b meta-egf-release |grep "Manifest revision" | awk '{print $3}')

repo start $B_ME  meta-egf
repo start $B_MEC meta-egf-common
repo start $B_MER meta-egf-release

cp -r .repo    ../yocto-input/sources
cp -r meta-egf ../yocto-input/sources

cd ..
rm -rf tmp 

cd  $MNT_DIR/docker