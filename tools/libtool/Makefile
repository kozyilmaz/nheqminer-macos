
target_name ?= libtool

include ../Makefile.build

LIBTOOL_VERSION="2.4.6"

libtool_clone:
	if [ ! -f "libtool-$(LIBTOOL_VERSION).tar.gz" ]; then curl -OL http://ftp.gnu.org/gnu/libtool/libtool-$(LIBTOOL_VERSION).tar.gz; fi;
	if [ ! -d "libtool-$(LIBTOOL_VERSION)" ]; then tar xzf libtool-$(LIBTOOL_VERSION).tar.gz; fi

libtool_config:
	( cd libtool-$(LIBTOOL_VERSION); ./configure --prefix=${BSPTOOLS} --program-prefix=g --enable-static --disable-shared ; )

libtool_build:
	make -C libtool-$(LIBTOOL_VERSION) -j ${BSPJOB}

libtool_install:
	${BSPSUDO} make -C libtool-$(LIBTOOL_VERSION) install

libtool_uninstall:
	${BSPSUDO} make -C libtool-$(LIBTOOL_VERSION) uninstall

libtool_clean:
	if [ -f "libtool-$(LIBTOOL_VERSION)/Makefile" ]; then make -C libtool-$(LIBTOOL_VERSION) distclean; fi

libtool_distclean:
	rm -rf libtool-$(LIBTOOL_VERSION)
	rm -rf libtool-$(LIBTOOL_VERSION).tar.gz
