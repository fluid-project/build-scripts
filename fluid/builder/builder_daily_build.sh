#!/bin/sh -x

# sets the BUILDER_HOME variable
# which points at the location where the builder is checked out to
export BUILDER_HOME=/home/continuum/apache-continuum-1.4.0/data/working-directory/19

# sets the INFUSION_DIR variable
# which points at the directory where Infusion is cloned to
export INFUSION_DIR=docs/infusionBuilder/infusion

# sets the INFUSION_CHECKOUT variable
# which is the git checkout of infusion to use. (e.g. branch, tag, commit)
export INFUSION_CHECKOUT=master

cd $BUILDER_HOME

# clone infusion into the docs/infusionBuilder/infusion directory
git clone https://github.com/fluid-project/infusion.git $INFUSION_DIR
echo "finished cloning Infusion"

cd $INFUSION_DIR

# sets the infusion git repo to the desired checkout
git checkout $INFUSION_CHECKOUT

cd $BUILDER_HOME

# run the builder's deploy script
ant -buildfile ./infusionBuilder-deploy/build.xml daily

echo "end of script"