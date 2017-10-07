#!/bin/sh

# get version info
git_rev_output=$(git rev-parse --verify HEAD)
git_tag_output=$(git describe --all --exact-match $git_rev_output)
git_status_output=$(git diff)

# check if associated tag exist for that commit
if [[ $git_tag_output == *"tags"* ]]; then
   git_tag_string=${git_tag_output##*/}
else
   git_tag_string="unknown"
fi

# check for any code modifications
if [ -n "$git_status_output" ]; then
   git_rev_string=$git_rev_output-dirty
   git_tag_string="unknown"
else
   git_rev_string=$git_rev_output
fi

# pick version string (tag name, if exists or commit version)
if [[ $git_tag_string == "unknown" ]]; then
   release_version=$git_rev_string
else
   release_version=$git_tag_string
fi

echo "tools rev version : $git_rev_string"
echo "tools tag version : $git_tag_string"
echo "creating 'tools-$release_version' release"

# prepare environment
source environment;
export BSPJOB=16;
export BSPSUDO=sudo;
export BSPTOOLS=/usr/local/tools-$release_version;
export PATH=${BSPTOOLS}/bin:${PATH};

# add version info
sudo mkdir -p ${BSPTOOLS}
echo $git_rev_string  > version.txt
echo $git_tag_string >> version.txt
sudo mv version.txt ${BSPTOOLS}/version.txt

# build tools
make
echo "'tools-$release_version' is installed with root priviliges under ${BSPTOOLS}"

# create tarball and checksum
echo "creating tools tarball 'tools-$release_version.tar.bz2' and checksum"
tar -cjvf tools-$release_version.tar.bz2 ${BSPTOOLS}
shasum -a 256 tools-$release_version.tar.bz2 > tools-$release_version.tar.bz2.hash
shasum -a 256 -c tools-$release_version.tar.bz2.hash
