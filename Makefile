
ifeq ($(BSPROOT),)
    $(error You must first run 'source environment')
endif

subdir-y := tools
subdir-y += boost
subdir-y += nheqminer

include Makefile.lib

check_tools: __FORCE
	@if [ ! -d tools/o/bin ]; then \
		ENABLE_CMAKE=y ENABLE_GCC=y make tools; \
	fi

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
