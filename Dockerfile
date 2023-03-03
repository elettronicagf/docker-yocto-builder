# Use Ubuntu 18.04 LTS as the basis for the Docker image.
FROM ubuntu:18.04

# Install all the Linux packages required for Yocto builds. Note that the packages python3,
# tar, locales and cpio are not listed in the official Yocto documentation. The build, however,
# without them.
RUN export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get -y install gawk wget git-core diffstat unzip texinfo gcc-multilib \
     build-essential chrpath socat cpio python python3 python3-pip python3-pexpect \
     xz-utils debianutils iputils-ping libsdl1.2-dev python3-git python3-jinja2 xterm tar locales curl openssh-client sudo nano vim \
     libegl1-mesa pylint3 rsync bc "linux-headers-$(uname -r)" apt-transport-https ca-certificates ftp


#sudo apt update
#sudo apt-get install apt-transport-https ca-certificates -y
#sudo update-ca-certificates


# By default, Ubuntu uses dash as an alias for sh. Dash does not support the source command
# needed for setting up the build environment in CMD. Use bash as an alias for sh.
RUN rm /bin/sh && ln -s bash /bin/sh

# Set the locale to en_US.UTF-8, because the Yocto build fails without any locale set.
RUN locale-gen en_US.UTF-8 && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

ENV USER_NAME yocto

# The running container writes all the build artefacts to a host directory (outside the container).
# The container can only write files to host directories, if it uses the same user ID and
# group ID owning the host directories. The HOST_UID and group_uid are passed to the docker build
# command with the --build-arg option. By default, they are both 1000. The docker image creates
# a group with HOST_GID and a user with HOST_UID and adds the user to the group. The symbolic
# name of the group and user is yocto.
ARG host_uid=1000
ARG host_gid=1000
RUN groupadd -g $host_gid $USER_NAME && useradd -g $host_gid -m -s /bin/bash -u $host_uid $USER_NAME

#add USER_NAME to sudo
RUN echo "$USER_NAME:$USER_NAME" | chpasswd && adduser $USER_NAME sudo

# By default, docker runs as root. However, Yocto builds should not be run as root, but as a 
# normal user. Hence, we switch to the newly created user smartplus.
USER $USER_NAME

# Create the directory structure for the Yocto build in the container. The lowest two directory
# levels must be the same as on the host.
ENV BUILD_INPUT_DIR /home/$USER_NAME
ENV BUILD_DOWNLOADS_DIR /home/$USER_NAME/downloads
ENV BUILD_OUTPUT_DIR /home/$USER_NAME/yocto-output
ENV YOCTO_INPUT_DIR /home/$USER_NAME/yocto-input
RUN mkdir -p $BUILD_INPUT_DIR $BUILD_OUTPUT_DIR $BUILD_DOWNLOADS_DIR


WORKDIR $BUILD_INPUT_DIR


#ENV DISTRO=fsl-imx-x11 MACHINE=$PRJ_MACHINE
#CMD source ./egf-setup-release.sh -b build
#CMD bitbake egf-image-$PROJECT


