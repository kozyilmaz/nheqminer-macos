
target_name ?= boost

include ../Makefile.build

BOOST_VERSION="1.63.0"

boost_clone:
	if [ ! -f "boost-$(BOOST_VERSION).tar.bz2" ]; then curl -o boost-$(BOOST_VERSION).tar.bz2 -L https://sourceforge.net/projects/boost/files/boost/$(BOOST_VERSION)/boost_1_63_0.tar.bz2; fi
	if [ ! -d "boost-$(BOOST_VERSION)" ]; then tar xvf boost-$(BOOST_VERSION).tar.bz2; fi


boost_config:
#	if [ ! -f boost-$(BOOST_VERSION)/tools/build/src/user-config.jam ]; then \
#		echo "using darwin : 6.3 : ${BSPTOOLS}/o/bin/g++-6.3.0 ; " >> boost-$(BOOST_VERSION)/tools/build/src/user-config.jam; \
#	fi
	( cd boost-$(BOOST_VERSION); ./bootstrap.sh --prefix=${BSPROOTFS}; )

boost_build:
#	( cd boost-$(BOOST_VERSION); ./b2 headers; ./b2 -j ${BSPJOB} link=static runtime-link=static threading=multi toolset=darwin-6.3; )
	( cd boost-$(BOOST_VERSION); ./b2 headers; ./b2 -j ${BSPJOB} link=static runtime-link=static threading=multi; )

boost_install:
#	( cd boost-$(BOOST_VERSION); ./b2 headers; ./b2 -j ${BSPJOB} link=static runtime-link=static threading=multi toolset=darwin-6.3 install; )
	( cd boost-$(BOOST_VERSION); ./b2 headers; ./b2 -j ${BSPJOB} link=static runtime-link=static threading=multi install; )

boost_uninstall:
	make -C boost-$(BOOST_VERSION) uninstall

boost_clean:
	if [ -f "boost-$(BOOST_VERSION)/Makefile" ]; then make -C boost-$(BOOST_VERSION) distclean; fi

boost_distclean:
	rm -rf boost-$(BOOST_VERSION)
