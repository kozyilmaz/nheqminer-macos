
target_name ?= rust

include ../Makefile.build

RUST_VERSION=1.17.0
RUST_PLATFORM=x86_64-apple-darwin

rust_clone:
	if [ ! -f "rust-$(RUST_VERSION)-$(RUST_PLATFORM).tar.gz" ]; then curl -OL https://static.rust-lang.org/dist/rust-$(RUST_VERSION)-$(RUST_PLATFORM).tar.gz; fi
	if [ ! -d "rust-$(RUST_VERSION)-$(RUST_PLATFORM)" ]; then tar xzf rust-$(RUST_VERSION)-$(RUST_PLATFORM).tar.gz; fi

rust_config:
	@true

rust_build:
	@true

rust_install:
	( cd rust-$(RUST_VERSION)-$(RUST_PLATFORM); ./install.sh --prefix=${BSPTOOLS}/o --without=rust-docs --disable-ldconfig; )

rust_uninstall:
	( cd rust-$(RUST_VERSION)-$(RUST_PLATFORM); ./install.sh --prefix=${BSPTOOLS}/o --uninstall; )

rust_clean:
	@true

rust_distclean:
	rm -rf rust-$(RUST_VERSION)-$(RUST_PLATFORM)
	rm -rf rust-$(RUST_VERSION)-$(RUST_PLATFORM).tar.gz
