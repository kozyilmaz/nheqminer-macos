
target_name ?= gnugcc

include ../Makefile.build

GCC_VERSION="6.3.0"

gnugcc_clone:
	if [ ! -f "gcc-$(GCC_VERSION).tar.gz" ]; then curl -OL http://ftp.gnu.org/gnu/gcc/gcc-$(GCC_VERSION)/gcc-$(GCC_VERSION).tar.gz; fi;
	if [ ! -d "gcc-$(GCC_VERSION)" ]; then tar xzf gcc-$(GCC_VERSION).tar.gz; fi

gnugcc_config:
	( cd gcc-$(GCC_VERSION); CFLAGS="" ./configure --prefix=${BSPTOOLS}/o --enable-checking=release --with-gmp=${BSPTOOLS}/o --with-mpfr=${BSPTOOLS}/o --with-mpc=${BSPTOOLS}/o --enable-languages=c,c++ --with-isl=${BSPTOOLS}/o --program-suffix=-$(GCC_VERSION); )

gnugcc_build:
	make -C gcc-$(GCC_VERSION) -j ${BSPJOB}

gnugcc_install:
	make -C gcc-$(GCC_VERSION) install

gnugcc_uninstall:
	make -C gcc-$(GCC_VERSION) uninstall

gnugcc_clean:
	if [ -f "gcc-$(GCC_VERSION)/Makefile" ]; then make -C gcc-$(GCC_VERSION) distclean; fi

gnugcc_distclean:
	rm -rf gcc-$(GCC_VERSION)
	rm -rf gcc-$(GCC_VERSION).tar.gz
