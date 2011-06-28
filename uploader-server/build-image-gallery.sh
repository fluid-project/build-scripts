#!/bin/sh

# sets the UPLOADER_SERVER_HOME directory
# the location where the image-gallery is checked out to
export UPLOADER_SERVER_HOME="/home/continuum/apache-continuum-1.4.0/data/working-directory/$1"
cd $UPLOADER_SERVER_HOME

# change the infusion path in image gallery ini setting file
sed 's;infusion = "../infusion";infusion = "infusion";g' image-gallery-settings.ini > image-gallery-settings.ini.new
mv image-gallery-settings.ini.new image-gallery-settings.ini

# clone infusion
rm -rf infusion/
git clone https://github.com/fluid-project/infusion.git

# run the image-gallery's install script
bash install.sh

echo "end of script"
