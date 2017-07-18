
target_name ?= objconv

include ../Makefile.build

objconv_clone:
	if [ ! -f "objconv.zip" ]; then curl -OL http://www.agner.org/optimize/objconv.zip; fi;
	if [ ! -d "objconv" ]; then unzip objconv.zip -d objconv; fi
	if [ ! -d "objconv/src" ]; then unzip objconv/source.zip -d objconv/src; fi

objconv_config:
	@true

objconv_build:
	( cd objconv/src; sh ./build.sh )

objconv_install:
	if [ -f "objconv/src/objconv" ]; then ${BSPSUDO} cp objconv/src/objconv ${BSPTOOLS}/bin; fi

objconv_uninstall:
	${BSPSUDO} rm -rf ${BSPTOOLS}/bin/objconv

objconv_clean:
	if [ -f "objconv/src/objconv" ]; then rm -rf objconv/src/objconv; fi

objconv_distclean:
	rm -rf objconv
	rm -rf objconv.zip
