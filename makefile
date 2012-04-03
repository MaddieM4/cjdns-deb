RELEASE := $(shell cat scripts/release)
VERSION := $(shell cat scripts/version)
ARCH := $(shell cat scripts/arch)

all : scripts/version
	scripts/mkpackage.sh

rebuild : all
	scripts/rebuild.sh

control : scripts/version scripts/arch
	sed "s/VERSION/Version: $(VERSION)/" < scripts/control_template | \
	sed "s/ARCH/Architecture: $(ARCH)/" > debian/DEBIAN/control
	
scripts/version : scripts/release
	echo "0.3-$(RELEASE)" > scripts/version
