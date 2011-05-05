#!/bin/sh

# sets the UPLOADER_SERVER_HOME directory
# the location where the image-gallery is checked out to
export UPLOADER_SERVER_HOME=/home/continuum/apache-continuum-1.4.0/data/working-directory/17

cd $UPLOADER_SERVER_HOME

# clone infusion
 git clone https://github.com/fluid-project/infusion.git
 echo "cloning finished"

# run the image-gallery's install script and set the location of infusion
echo "./infusion" | ./install.sh

echo "end of script"
