#!/bin/sh

# get version info
git_revision_output=$(git rev-parse --verify HEAD)
git_tag_output=$(git describe --all --exact-match $git_revision_output)
git_status_output=$(git diff)

# check associated tag
if [[ $git_tag_output == *"tags"* ]]; then
   git_tag_string=${git_tag_output##*/}
else
   git_tag_string="unknown"
fi

# check for modifications
if [ -n "$git_status_output" ]; then
   git_version_string=$git_revision_output-dirty
   git_tag_string="unknown"
else
   git_version_string=$git_revision_output
fi

echo "tools commit version : $git_version_string"
echo "tools tag version    : $git_tag_string"
echo "creating 'tools-$git_version_string' release"

# prepare environment
source environment;
export BSPJOB=16;
export BSPSUDO=sudo;
export BSPTOOLS=/usr/local/tools-$git_version_string;
export PATH=${BSPTOOLS}/bin:${PATH};

# add version info
sudo mkdir -p ${BSPTOOLS}
echo $git_version_string > version.txt
echo $git_tag_string    >> version.txt
sudo mv version.txt ${BSPTOOLS}/version.txt

# build tools
make
echo "'tools-$git_version_string' is installed with root priviliges under ${BSPTOOLS}"

# create tarball and checksum
echo "creating tools tarball 'tools-$git_version_string.tar.bz2' and checksum"
tar -cjvf tools-$git_version_string.tar.bz2 ${BSPTOOLS}
shasum -a 256 tools-$git_version_string.tar.bz2 > tools-$git_version_string.tar.bz2.hash
shasum -a 256 -c tools-$git_version_string.tar.bz2.hash
