
ifeq ($(BSPROOT),)
    $(error You must first run 'source environment')
endif

subdir-y := tools
subdir-y += boost
subdir-y += nheqminer

tools_depends-y = \
	syscheck

boost_depends-y = \
	tools

nheqminer_depends-y = \
	boost

include Makefile.lib

OSX_CUDA_BIN := $(shell ls -d /usr/local/cuda/bin/nvcc | tail -n 1)
OSX_CUDA_GCC := $(shell clang --version | grep clang-800.0.42.1)

syscheck:
	@echo "\033[1;34mSoftware Version:\033[0m"
	@sw_vers
	@echo "\033[1;34mCompiler Version:\033[0m"
	@gcc -v
	@echo "\033[1;34mNVCC Version:\033[0m"
# do we have CUDA compiler?
ifneq ($(OSX_CUDA_BIN),)
	@/usr/local/cuda/bin/nvcc --version
# if yes, are macOS tools compatible with that CUDA version?
ifneq ($(OSX_CUDA_GCC),)
	@echo "\033[1;92mUsing CUDA compatible 'Command Line Tools macOS 10.12 for Xcode 8.2'\033[0m"
else
	@echo "\033[1;31mCUDA compatible 'Command Line Tools macOS 10.12 for Xcode 8.2' not found!\033[0m"
	@echo "\033[1;31mDownload and install 'Command Line Tools macOS 10.12 for Xcode 8.2' from 'https://developer.apple.com/download/more'\033[0m"
	@echo "\033[1;31mAfter installation run command below to switch to CUDA Toolkit compatible command line tools"
	@echo "\033[1;31m  \$$ sudo xcode-select -switch /Library/Developer/CommandLineTools\033[0m"
	@echo "\033[1;31mRun command below to switch back to latest command line tools (Xcode 8.3 atm)"
	@echo "\033[1;31m  \$$ sudo xcode-select -switch /Applications/Xcode.app/Contents/Developer\033[0m"
	@false
endif
else
	@echo "\033[1;31mNo CUDA toolkit found!\033[0m"
	@echo "\033[1;31mDownload and install 'CUDA Toolkit 8.0.61' from 'https://developer.nvidia.com/cuda-downloads'\033[0m"
	@echo "\033[1;31mAfter installation CUDA compiler 'nvcc' and library 'libcuda.dylib' will be present, run 'make' again!\033[0m"
	@false
endif

clone:
	@true

config:
	@true

build:
	@true

install:
	@true

uninstall:
	@true

clean:
	@true

distclean: clean
	@true
