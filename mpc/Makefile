
target_name ?= mpc

include ../Makefile.build

MPC_VERSION="1.0.3"

mpc_clone:
	if [ ! -f "mpc-$(MPC_VERSION).tar.gz" ]; then curl -OL http://ftp.gnu.org/gnu/mpc/mpc-$(MPC_VERSION).tar.gz; fi;
	if [ ! -d "mpc-$(MPC_VERSION)" ]; then tar xzf mpc-$(MPC_VERSION).tar.gz; fi

mpc_config:
	( cd mpc-$(MPC_VERSION); ./configure --prefix=${BSPTOOLS} --with-gmp=${BSPTOOLS} --with-mpfr=${BSPTOOLS} --enable-static --disable-shared; )

mpc_build:
	make -C mpc-$(MPC_VERSION) -j ${BSPJOB}

mpc_install:
	${BSPSUDO} make -C mpc-$(MPC_VERSION) install

mpc_uninstall:
	${BSPSUDO} make -C mpc-$(MPC_VERSION) uninstall

mpc_clean:
	if [ -f "mpc-$(MPC_VERSION)/Makefile" ]; then make -C mpc-$(MPC_VERSION) distclean; fi

mpc_distclean:
	rm -rf mpc-$(MPC_VERSION)
	rm -rf mpc-$(MPC_VERSION).tar.gz
