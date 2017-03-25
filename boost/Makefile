
target_name ?= boost

include ../Makefile.build

BOOST_VERSION="1.63.0"

boost_clone:
	if [ ! -d "$(BOOST_VERSION)" ]; then git clone -b $(BOOST_VERSION) --recursive https://github.com/boostorg/boost.git $(BOOST_VERSION); fi

boost_config:
	if [ ! -f $(BOOST_VERSION)/tools/build/src/user-config.jam ]; then \
		echo "using darwin : 6.3 : ${BSPTOOLS}/o/bin/g++-6.3.0 ; " >> $(BOOST_VERSION)/tools/build/src/user-config.jam; \
	fi
	( cd $(BOOST_VERSION); ./bootstrap.sh --prefix=${BSPROOTFS}; )

boost_build:
	( cd $(BOOST_VERSION); ./b2 headers; ./b2 -j ${BSPJOB} link=static runtime-link=static threading=multi toolset=darwin-6.3; )

boost_install:
	( cd $(BOOST_VERSION); ./b2 headers; ./b2 -j ${BSPJOB} link=static runtime-link=static threading=multi toolset=darwin-6.3 install; )

boost_uninstall:
	make -C $(BOOST_VERSION) uninstall

boost_clean:
	if [ -f "$(BOOST_VERSION)/Makefile" ]; then make -C $(BOOST_VERSION) distclean; fi

boost_distclean:
	rm -rf $(BOOST_VERSION)
