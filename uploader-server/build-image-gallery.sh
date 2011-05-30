#!/bin/sh

# sets the UPLOADER_SERVER_HOME directory
# the location where the image-gallery is checked out to
export UPLOADER_SERVER_HOME="/home/continuum/apache-continuum-1.4.0/data/working-directory/17"

cd $UPLOADER_SERVER_HOME
# remove temp directory, install.sh doesn't like it. this only applies when run manually, but still
rm -rf infusion temp

# clone infusion
 git clone https://github.com/fluid-project/infusion.git

# run the image-gallery's install script and set the location of infusion
echo "../infusion" | bash install.sh

echo "end of script"
