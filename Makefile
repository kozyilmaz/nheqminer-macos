
ifeq ($(BSPROOT),)
    $(error You must first run 'source environment')
endif

subdir-y := boost
subdir-y += nheqminer

boost_depends-y = \
	$(shell if [ ! -d ${BSPTOOLS}/o/bin ]; then make -C tools; fi)

nheqminer_depends-y = \
	boost

include Makefile.lib

clone:
	@true

config:
	@true

build:
	@true

install:
	@true

uninstall:
	@true

clean:
	@true

distclean: clean
	@true
