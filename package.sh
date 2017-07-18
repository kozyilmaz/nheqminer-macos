#!/bin/sh

echo "build and install tools with root privileges"

# get version info
git_commit_output=$(git log -1)
git_revision_output=$(git rev-parse --verify HEAD)
git_status_output=$(git diff)
if [ -n "$git_status_output" ]; then
   git_version_string=$git_revision_output-dirty
else
   git_version_string=$git_revision_output
fi
echo "tools commit version: $git_version_string"

# prepare environment
source environment;
export BSPJOB=16;
export BSPSUDO=sudo;
export BSPTOOLS=/usr/local/tools-$git_version_string;
export PATH=${BSPTOOLS}/bin:${PATH};

# add version info
sudo mkdir -p ${BSPTOOLS}
echo $git_version_string > version.txt
echo $git_commit_output >> version.txt
sudo mv version.txt ${BSPTOOLS}/version.txt

# build tools
make
echo "tools version '$git_version_string' is installed with root priviliges under ${BSPTOOLS}"

# create tarball and checksum
echo "creating tools tarball 'tools-$git_version_string.tar.bz2' and checksum"
tar -cjvf tools-$git_version_string.tar.bz2 ${BSPTOOLS}
shasum -a 256 tools-$git_version_string.tar.bz2  > tools-$git_version_string.tar.bz2.hash
shasum -a 256 -c tools-$git_version_string.tar.bz2.hash
