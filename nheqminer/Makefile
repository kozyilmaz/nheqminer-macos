
target_name ?= nheqminer

include ../Makefile.build

NHEQMINER_VERSION="0.5c"

nheqminer_clone:
	if [ ! -f "nheqminer-$(NHEQMINER_VERSION).tar.gz" ]; then curl -o nheqminer-$(NHEQMINER_VERSION).tar.gz -L https://github.com/nicehash/nheqminer/archive/$(NHEQMINER_VERSION).tar.gz; fi
	if [ ! -d "nheqminer-$(NHEQMINER_VERSION)" ]; then tar xvf nheqminer-$(NHEQMINER_VERSION).tar.gz; fi

nheqminer_config:
	( cd nheqminer-$(NHEQMINER_VERSION); ./configure --prefix=${BSPROOTFS}; )

nheqminer_build:
	make -C nheqminer-$(AUTOMAKE_VERSION) -j ${BSPJOB}

nheqminer_install:
	make -C nheqminer-$(AUTOMAKE_VERSION) -j ${BSPJOB} install

nheqminer_uninstall:
	make -C nheqminer-$(NHEQMINER_VERSION) uninstall

nheqminer_clean:
	if [ -f "nheqminer-$(NHEQMINER_VERSION)/Makefile" ]; then make -C nheqminer-$(NHEQMINER_VERSION) distclean; fi

nheqminer_distclean:
	rm -rf nheqminer-$(NHEQMINER_VERSION)
