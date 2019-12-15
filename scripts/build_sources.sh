#!/bin/bash
# Builds sources

source /tmp/scripts/variables.sh

change_directory $ROOT_DIRECTORY/src

$DPKG_BUILDPACKAGE
