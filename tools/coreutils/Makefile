
target_name ?= coreutils

include ../Makefile.build

COREUTILS_VERSION="8.28"

coreutils_clone:
	if [ ! -f "coreutils-$(COREUTILS_VERSION).tar.xz" ]; then curl -OL https://ftp.gnu.org/gnu/coreutils/coreutils-$(COREUTILS_VERSION).tar.xz; fi;
	if [ ! -d "coreutils-$(COREUTILS_VERSION)" ]; then tar xzf coreutils-$(COREUTILS_VERSION).tar.xz; fi

coreutils_config:
	( cd coreutils-$(COREUTILS_VERSION); ./configure --prefix=${BSPTOOLS} --program-prefix=g; )

coreutils_build:
	make -C coreutils-$(COREUTILS_VERSION) -j ${BSPJOB}

coreutils_install:
	if [ -f "coreutils-$(COREUTILS_VERSION)/src/readlink" ]; then ${BSPSUDO} cp coreutils-$(COREUTILS_VERSION)/src/readlink ${BSPTOOLS}/bin/greadlink; ${BSPSUDO} ln -sf ${BSPTOOLS}/bin/greadlink ${BSPTOOLS}/bin/readlink; fi
	if [ -f "coreutils-$(COREUTILS_VERSION)/src/ginstall" ]; then ${BSPSUDO} cp coreutils-$(COREUTILS_VERSION)/src/ginstall ${BSPTOOLS}/bin/ginstall; ${BSPSUDO} ln -sf ${BSPTOOLS}/bin/ginstall ${BSPTOOLS}/bin/install; fi

coreutils_uninstall:
	${BSPSUDO} rm -rf ${BSPTOOLS}/bin/readlink
	${BSPSUDO} rm -rf ${BSPTOOLS}/bin/greadlink
	${BSPSUDO} rm -rf ${BSPTOOLS}/bin/install
	${BSPSUDO} rm -rf ${BSPTOOLS}/bin/ginstall

coreutils_clean:
	if [ -f "coreutils-$(COREUTILS_VERSION)/Makefile" ]; then make -C coreutils-$(COREUTILS_VERSION) distclean; fi

coreutils_distclean:
	rm -rf coreutils-$(COREUTILS_VERSION)
	rm -rf coreutils-$(COREUTILS_VERSION).tar.xz
