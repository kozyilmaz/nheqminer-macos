
target_name ?= autoconf

include ../Makefile.build

AUTOCONF_VERSION="2.69"

autoconf_clone:
	if [ ! -f "autoconf-$(AUTOCONF_VERSION).tar.gz" ]; then curl -OL http://ftp.gnu.org/gnu/autoconf/autoconf-$(AUTOCONF_VERSION).tar.gz; fi
	if [ ! -d "autoconf-$(AUTOCONF_VERSION)" ]; then tar xzf autoconf-$(AUTOCONF_VERSION).tar.gz; fi

autoconf_config:
	( cd autoconf-$(AUTOCONF_VERSION); ./configure --prefix=${BSPTOOLS} )

autoconf_build:
	make -C autoconf-$(AUTOCONF_VERSION) -j ${BSPJOB}

autoconf_install:
	${BSPSUDO} make -C autoconf-$(AUTOCONF_VERSION) install

autoconf_uninstall:
	${BSPSUDO} make -C autoconf-$(AUTOCONF_VERSION) uninstall

autoconf_clean:
	if [ -f "autoconf-$(AUTOCONF_VERSION)/Makefile" ]; then make -C autoconf-$(AUTOCONF_VERSION) distclean; fi

autoconf_distclean:
	rm -rf autoconf-$(AUTOCONF_VERSION)
	rm -rf autoconf-$(AUTOCONF_VERSION).tar.gz
