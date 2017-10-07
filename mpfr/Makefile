
target_name ?= mpfr

include ../Makefile.build

MPFR_VERSION="3.1.6"

mpfr_clone:
	if [ ! -f "mpfr-$(MPFR_VERSION).tar.gz" ]; then curl -OL http://ftp.gnu.org/gnu/mpfr/mpfr-$(MPFR_VERSION).tar.bz2; fi;
	if [ ! -d "mpfr-$(MPFR_VERSION)" ]; then tar xzf mpfr-$(MPFR_VERSION).tar.bz2; fi

mpfr_config:
	( cd mpfr-$(MPFR_VERSION); ./configure --prefix=${BSPTOOLS} --with-gmp=${BSPTOOLS} --enable-static --disable-shared; )

mpfr_build:
	make -C mpfr-$(MPFR_VERSION) -j ${BSPJOB}

mpfr_install:
	${BSPSUDO} make -C mpfr-$(MPFR_VERSION) install

mpfr_uninstall:
	${BSPSUDO} make -C mpfr-$(MPFR_VERSION) uninstall

mpfr_clean:
	if [ -f "mpfr-$(MPFR_VERSION)/Makefile" ]; then make -C mpfr-$(MPFR_VERSION) distclean; fi

mpfr_distclean:
	rm -rf mpfr-$(MPFR_VERSION)
	rm -rf mpfr-$(MPFR_VERSION).tar.bz2
