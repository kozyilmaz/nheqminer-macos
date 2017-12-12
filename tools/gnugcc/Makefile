
target_name ?= gnugcc

include ../Makefile.build

GCC_VERSION="7.2.0"

gnugcc_clone:
	if [ ! -f "gcc-$(GCC_VERSION).tar.gz" ]; then curl -OL http://ftp.gnu.org/gnu/gcc/gcc-$(GCC_VERSION)/gcc-$(GCC_VERSION).tar.gz; fi;
	if [ ! -d "gcc-$(GCC_VERSION)" ]; then tar xzf gcc-$(GCC_VERSION).tar.gz; fi

gnugcc_config:
	( cd gcc-$(GCC_VERSION); CFLAGS="" ./configure --prefix=${BSPTOOLS} --enable-checking=release --with-gmp=${BSPTOOLS} --with-mpfr=${BSPTOOLS} --with-mpc=${BSPTOOLS} --enable-languages=c,c++ --with-isl=${BSPTOOLS} --program-suffix=-$(GCC_VERSION); )

gnugcc_build:
	make -C gcc-$(GCC_VERSION) -j ${BSPJOB}

gnugcc_install:
	${BSPSUDO} make -C gcc-$(GCC_VERSION) install

gnugcc_uninstall:
	${BSPSUDO} make -C gcc-$(GCC_VERSION) uninstall

gnugcc_clean:
	if [ -f "gcc-$(GCC_VERSION)/Makefile" ]; then make -C gcc-$(GCC_VERSION) distclean; fi

gnugcc_distclean:
	rm -rf gcc-$(GCC_VERSION)
	rm -rf gcc-$(GCC_VERSION).tar.gz
