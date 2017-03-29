
target_name ?= nheqminer

include ../Makefile.build

NHEQMINER_VERSION="0.5c"

nheqminer_clone:
	if [ ! -f "nheqminer-$(NHEQMINER_VERSION).tar.gz" ]; then curl -o nheqminer-$(NHEQMINER_VERSION).tar.gz -L https://github.com/nicehash/nheqminer/archive/$(NHEQMINER_VERSION).tar.gz; fi
	if [ ! -d "nheqminer-$(NHEQMINER_VERSION)" ]; then tar xvf nheqminer-$(NHEQMINER_VERSION).tar.gz; ln -sf nheqminer-$(NHEQMINER_VERSION) nheqminer; fi

nheqminer_config:
	$(call patchme,nheqminer-$(NHEQMINER_VERSION))
	( cd nheqminer-$(NHEQMINER_VERSION)/cpu_xenoncat/asm_linux; sh assemble.sh; )
	( cd nheqminer-$(NHEQMINER_VERSION); CC=gcc-6.3.0 CXX=g++-6.3.0 BOOST_ROOT=${BSPROOTFS} cmake -DCMAKE_INSTALL_PREFIX=${BSPROOTFS} -DUSE_CUDA_DJEZO=OFF .; )

nheqminer_build:
	make -C nheqminer-$(NHEQMINER_VERSION) -j ${BSPJOB}

nheqminer_install:
	make -C nheqminer-$(NHEQMINER_VERSION) -j ${BSPJOB} install

nheqminer_uninstall:
	make -C nheqminer-$(NHEQMINER_VERSION) uninstall

nheqminer_clean:
	if [ -f "nheqminer-$(NHEQMINER_VERSION)/Makefile" ]; then make -C nheqminer-$(NHEQMINER_VERSION) distclean; fi

nheqminer_distclean:
	rm -rf nheqminer-$(NHEQMINER_VERSION)
