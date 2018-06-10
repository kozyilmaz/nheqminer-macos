
target_name ?= boost

include ../Makefile.build

BOOST_VERSION="1_67_0"

boost_clone:
	if [ ! -f "boost_$(BOOST_VERSION).tar.bz2" ]; then curl -OL https://sourceforge.net/projects/boost/files/boost/1.67.0/boost_$(BOOST_VERSION).tar.bz2; fi
	if [ ! -d "boost_$(BOOST_VERSION)" ]; then tar xvf boost_$(BOOST_VERSION).tar.bz2; fi

boost_config:
	( cd boost_$(BOOST_VERSION); ./bootstrap.sh --prefix=${BSPROOTFS} --without-icu --with-libraries=system,log,date_time,filesystem,thread; )

boost_build:
	( cd boost_$(BOOST_VERSION); ./b2 headers; ./b2 -j ${BSPJOB} variant=release link=static runtime-link=shared threading=multi ; )

boost_install:
	( cd boost_$(BOOST_VERSION); ./b2 headers; ./b2 -j ${BSPJOB} variant=release link=static runtime-link=shared threading=multi install; )

boost_uninstall:
	make -C boost_$(BOOST_VERSION) uninstall

boost_clean:
	if [ -f "boost_$(BOOST_VERSION)/Makefile" ]; then make -C boost_$(BOOST_VERSION) distclean; fi

boost_distclean:
	rm -rf boost_$(BOOST_VERSION)
