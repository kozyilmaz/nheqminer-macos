# GNU Tools for macOS

This repository builds most used GNU tools for macOS  
No additional dependency required except Xcode Command Line Tools  
All build tools are compiled from scratch with native macOS `clang`  

### Available packages
```
autoconf
automake
libtool    (prefixed with 'g')
pkg-config
objconv
fasm
cmake
coreutils  (only install and readlink)
kconfig
gmp        (only as static library)
mpfr       (only as static library)
mpc        (only as static library)
isl        (only as static library)
gcc        (suffixed with version)
```

### Build instructions
```shell
# run once to install Xcode CLI tools
$ xcode-select --install

# clone and build tools
$ git clone https://github.com/kozyilmaz/tools.git
$ cd tools
$ source environment
$ make
```

### Fine Tuning and Debugging
```shell
# console logs will be enabled via PRINT_DEBUG
$ cd tools
$ source environment
$ PRINT_DEBUG=y make all

# environment file can be edited to increase/decrease parallel jobs
BSPJOB=4

# environment file can be edited to select/unselect packages:
export TOOLS_ENABLE_ESSENTIALS=y
export TOOLS_ENABLE_OBJCONV=y
export TOOLS_ENABLE_FASM=y
export TOOLS_ENABLE_CMAKE=y
export TOOLS_ENABLE_GNUTOOLS=y
export TOOLS_ENABLE_KCONFIG=y
export TOOLS_ENABLE_GCC=y
```
