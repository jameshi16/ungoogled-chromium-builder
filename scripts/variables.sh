#!/bin/bash
# Global Variables used by all the scripts

set -e

export ADD_REPO="add-apt-repository"
export APT_INSTALL="apt-get install -y"
export APT_GET="apt-get update"
export APT_KEY="apt-key add"
export APT_SEARCH="apt-cache search"
export CD="cd"
export CHMOD="chmod"
export CP="cp -r"
export DPKG_BUILDPACKAGE="dpkg-buildpackage -b -uc"
export MK_BUILD_DEPS="mk-build-deps"
export MKDIR="mkdir -p"
export MV="mv"
export GIT_AM="git apply"
export GIT_CLONE="git clone"
export GIT_CHECKOUT="git checkout --recurse-submodules"
export GIT_SUBMODULE_UPDATE_INIT="git submodule update --init"
export RM="rm"
export WGET="wget"
export YES="yes"

export ROOT_DIRECTORY="/tmp/ungoogled-chromium-builder"

export DEBIAN_FRONTEND=noninteractive

change_directory() {
	$MKDIR $1
	$CD $1	
}
