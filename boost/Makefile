
target_name ?= boost

include ../Makefile.build

BOOST_VERSION="1_63_0"

boost_clone:
	if [ ! -f "boost_$(BOOST_VERSION).tar.bz2" ]; then curl -OL https://sourceforge.net/projects/boost/files/boost/1.63.0/boost_$(BOOST_VERSION).tar.bz2; fi
	if [ ! -d "boost_$(BOOST_VERSION)" ]; then tar xvf boost_$(BOOST_VERSION).tar.bz2; fi

boost_config:
#	if [ ! -f boost_$(BOOST_VERSION)/tools/build/src/user-config.jam ]; then \
#		echo "using darwin : 6.3 : ${BSPTOOLS}/o/bin/g++-6.3.0 ; " >> boost_$(BOOST_VERSION)/tools/build/src/user-config.jam; \
#	fi
	( cd boost_$(BOOST_VERSION); ./bootstrap.sh --prefix=${BSPROOTFS} --without-icu; )

boost_build:
#	( cd boost_$(BOOST_VERSION); ./b2 headers; ./b2 -j ${BSPJOB} variant=release link=static runtime-link=static threading=multi toolset=darwin-6.3; )
	( cd boost_$(BOOST_VERSION); ./b2 headers; ./b2 -j ${BSPJOB} variant=release link=static runtime-link=static threading=multi ; )

boost_install:
#	( cd boost_$(BOOST_VERSION); ./b2 headers; ./b2 -j ${BSPJOB} variant=release link=static runtime-link=static threading=multi toolset=darwin-6.3 install; )
	( cd boost_$(BOOST_VERSION); ./b2 headers; ./b2 -j ${BSPJOB} variant=release link=static runtime-link=static threading=multi install; )

boost_uninstall:
	make -C boost_$(BOOST_VERSION) uninstall

boost_clean:
	if [ -f "boost_$(BOOST_VERSION)/Makefile" ]; then make -C boost_$(BOOST_VERSION) distclean; fi

boost_distclean:
	rm -rf boost_$(BOOST_VERSION)
