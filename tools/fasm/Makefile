
target_name ?= fasm

include ../Makefile.build

FASM_VERSION="1.72"

fasm_clone:
	if [ ! -f "fasm-$(FASM_VERSION).tar.gz" ]; then curl -OL https://flatassembler.net/fasm-$(FASM_VERSION).tar.gz; fi;
	if [ ! -d "fasm" ]; then tar -xvf fasm-$(FASM_VERSION).tar.gz; fi

fasm_config:
	$(call patchme,fasm)

fasm_build:
	( cd fasm; \
		rm -rf fasm.o; \
		../precompiled/fasm source/libc/fasm.asm fasm.o; \
		objconv -fmac -nu fasm.o fasm.mo; \
		ld -arch i386 -macosx_version_min 10.6 -o fasm fasm.mo /usr/lib/crt1.o /usr/lib/libc.dylib; \
	)

fasm_install:
	if [ -f "fasm/fasm" ]; then ${BSPSUDO} cp fasm/fasm ${BSPTOOLS}/bin; fi

fasm_uninstall:
	${BSPSUDO} rm -rf ${BSPTOOLS}/bin/fasm

fasm_clean:
	if [ -f "fasm/fasm" ]; then rm -rf fasm/fasm; fi

fasm_distclean:
	rm -rf fasm
	rm -rf fasm-$(FASM_VERSION).tar.gz
