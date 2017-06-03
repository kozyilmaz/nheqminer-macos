
target_name ?= kconfig

include ../Makefile.build

KCONFIG_VERSION="0.0.2"

kconfig_clone:
	if [ ! -d "kconfig-$(KCONFIG_VERSION)" ]; then git clone -b $(KCONFIG_VERSION) https://github.com/kozyilmaz/kconfig.git kconfig-$(KCONFIG_VERSION); fi

kconfig_config:
	@true

kconfig_build:
	PKG_CONFIG_PATH="" make CC="gcc" HOSTCC="gcc" obj=. -C kconfig-$(KCONFIG_VERSION) -f Makefile.br conf
	PKG_CONFIG_PATH="" make CC="gcc" HOSTCC="gcc" obj=. -C kconfig-$(KCONFIG_VERSION) -f Makefile.br mconf

kconfig_install:
	if [ -f "kconfig-$(KCONFIG_VERSION)/conf" ]; then cp kconfig-$(KCONFIG_VERSION)/conf ${BSPTOOLS}/o/bin; fi
	if [ -f "kconfig-$(KCONFIG_VERSION)/mconf" ]; then cp kconfig-$(KCONFIG_VERSION)/mconf ${BSPTOOLS}/o/bin; fi

kconfig_uninstall:
	rm -rf ${BSPTOOLS}/o/bin/conf
	rm -rf ${BSPTOOLS}/o/bin/mconf

kconfig_clean:
	if [ -d "kconfig-$(KCONFIG_VERSION)" ]; then PKG_CONFIG_PATH="" make CC="gcc" HOSTCC="gcc" obj=. -C kconfig-$(KCONFIG_VERSION) -f Makefile.br distclean; fi

kconfig_distclean:
	rm -rf kconfig-$(KCONFIG_VERSION)
