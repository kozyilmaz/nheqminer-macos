
target_name ?= nheqminer

include ../Makefile.build

NHEQMINER_VERSION="0.5c"

nheqminer_clone:
	if [ ! -f "nheqminer-$(NHEQMINER_VERSION).tar.gz" ]; then curl -o nheqminer-$(NHEQMINER_VERSION).tar.gz -L https://github.com/nicehash/nheqminer/archive/$(NHEQMINER_VERSION).tar.gz; fi
	if [ ! -d "nheqminer-$(NHEQMINER_VERSION)" ]; then tar xvf nheqminer-$(NHEQMINER_VERSION).tar.gz; ln -sf nheqminer-$(NHEQMINER_VERSION) nheqminer; fi

nheqminer_config:
	$(call patchme,nheqminer-$(NHEQMINER_VERSION))
	( cd nheqminer-$(NHEQMINER_VERSION)/cpu_xenoncat/asm_linux; rm -rf equihash_avx*.elf.o equihash_avx*.o ; sh assemble.sh; )
#	( mkdir -p nheqminer-build; cd nheqminer-build; CC=gcc-6.3.0 CXX=g++-6.3.0 BOOST_ROOT=${BSPROOTFS} cmake -DCMAKE_INSTALL_PREFIX=${BSPROOTFS} -DCMAKE_CXX_FLAGS="-m64 -msse2 -O2 -fvisibility=hidden" -DUSE_CPU_TROMP=OFF -DUSE_CUDA_TROMP=OFF -DUSE_CPU_XENONCAT=ON -DUSE_CUDA_DJEZO=OFF ../nheqminer-$(NHEQMINER_VERSION); )
	( mkdir -p nheqminer-build; cd nheqminer-build; BOOST_ROOT=${BSPROOTFS} cmake -DCMAKE_INSTALL_PREFIX=${BSPROOTFS} -DCMAKE_CXX_FLAGS="-m64 -msse2 -O2 -fvisibility=hidden" -DUSE_CPU_TROMP=OFF -DUSE_CUDA_TROMP=OFF -DUSE_CPU_XENONCAT=ON -DUSE_CUDA_DJEZO=OFF ../nheqminer-$(NHEQMINER_VERSION); )

nheqminer_build:
	make -C nheqminer-build -j ${BSPJOB}

nheqminer_install:
	if [ -f "nheqminer-build/nheqminer" ]; then cp nheqminer-build/nheqminer nheqminer-macos; fi

nheqminer_uninstall:
	@true

nheqminer_clean:
	if [ -f "nheqminer-build/Makefile" ]; then make -C nheqminer-build clean; fi

nheqminer_distclean:
	rm -rf nheqminer-build
	rm -rf nheqminer-$(NHEQMINER_VERSION)
