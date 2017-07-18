
target_name ?= automake

include ../Makefile.build

AUTOMAKE_VERSION="1.15.1"

automake_clone:
	if [ ! -f "automake-$(AUTOMAKE_VERSION).tar.gz" ]; then curl -OL http://ftp.gnu.org/gnu/automake/automake-$(AUTOMAKE_VERSION).tar.gz; fi;
	if [ ! -d "automake-$(AUTOMAKE_VERSION)" ]; then tar xzf automake-$(AUTOMAKE_VERSION).tar.gz; fi

automake_config:
	( cd automake-$(AUTOMAKE_VERSION); ./configure --prefix=${BSPTOOLS}; )

automake_build:
	make -C automake-$(AUTOMAKE_VERSION) -j ${BSPJOB}

automake_install:
	${BSPSUDO} make -C automake-$(AUTOMAKE_VERSION) install

automake_uninstall:
	${BSPSUDO} make -C automake-$(AUTOMAKE_VERSION) uninstall

automake_clean:
	if [ -f "automake-$(AUTOMAKE_VERSION)/Makefile" ]; then make -C automake-$(AUTOMAKE_VERSION) distclean; fi

automake_distclean:
	rm -rf automake-$(AUTOMAKE_VERSION)
	rm -rf automake-$(AUTOMAKE_VERSION).tar.gz
