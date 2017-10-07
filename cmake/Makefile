
target_name ?= cmake

include ../Makefile.build

CMAKE_VERSION="3.9.3"

cmake_clone:
	if [ ! -f "cmake-$(CMAKE_VERSION).tar.gz" ]; then curl -OL https://cmake.org/files/v3.9/cmake-$(CMAKE_VERSION).tar.gz; fi;
	if [ ! -d "cmake-$(CMAKE_VERSION)" ]; then tar xzf cmake-$(CMAKE_VERSION).tar.gz; fi

cmake_config:
	( cd cmake-$(CMAKE_VERSION); CFLAGS="" CXXFLAGS="" ./bootstrap --prefix=${BSPTOOLS}; )

cmake_build:
	make -C cmake-$(CMAKE_VERSION) -j ${BSPJOB}

cmake_install:
	${BSPSUDO} make -C cmake-$(CMAKE_VERSION) -j ${BSPJOB} install

cmake_uninstall:
	${BSPSUDO} make -C cmake-$(CMAKE_VERSION) uninstall

cmake_clean:
	if [ -f "cmake-$(CMAKE_VERSION)/Makefile" ]; then make -C cmake-$(CMAKE_VERSION) distclean; fi

cmake_distclean:
	rm -rf cmake-$(CMAKE_VERSION)
	rm -rf cmake-$(CMAKE_VERSION).tar.gz
