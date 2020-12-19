#!/bin/bash
# Moves the resultant *.deb files to a folder we can copy from the container later

source /tmp/scripts/variables.sh

change_directory $ROOT_DIRECTORY/output
change_directory $ROOT_DIRECTORY

$MV $ROOT_DIRECTORY/ungoogled-chromium-debian/*.deb $ROOT_DIRECTORY/output
