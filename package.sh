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

echo "nheqminer-macos rev version : $git_rev_string"
echo "nheqminer-macos tag version : $git_tag_string"
echo "creating 'nheqminer-macos-$release_version' release"

# prepare environment
source environment;
export BSPJOB=16;
export BSPINSTALL=${BSPROOT}/nheqminer-macos-$release_version;

# build tools
mkdir -p ${BSPINSTALL}
make
cp -a miner/* ${BSPINSTALL}
echo "nheqminer"      > ${BSPINSTALL}/version.txt
echo "========="     >> ${BSPINSTALL}/version.txt
echo $git_rev_string >> ${BSPINSTALL}/version.txt
echo $git_tag_string >> ${BSPINSTALL}/version.txt
echo "platform" >> ${BSPINSTALL}/version.txt
echo "========" >> ${BSPINSTALL}/version.txt
sw_vers         >> ${BSPINSTALL}/version.txt
echo "compiler" >> ${BSPINSTALL}/version.txt
echo "========" >> ${BSPINSTALL}/version.txt
gcc -v         2>> ${BSPINSTALL}/version.txt
echo "cuda"     >> ${BSPINSTALL}/version.txt
echo "===="     >> ${BSPINSTALL}/version.txt
/usr/local/cuda/bin/nvcc --version >> ${BSPINSTALL}/version.txt

echo "nheqminer for macOS ($release_version) is installed to ${BSPINSTALL}"

# create tarball and checksum
echo "creating tarball 'nheqminer-macos-$release_version.tar.bz2' and checksum"
tar -cjvf nheqminer-macos-$release_version.tar.bz2 nheqminer-macos-$release_version
shasum -a 256 nheqminer-macos-$release_version.tar.bz2 > nheqminer-macos-$release_version.tar.bz2.hash
shasum -a 256 -c nheqminer-macos-$release_version.tar.bz2.hash
