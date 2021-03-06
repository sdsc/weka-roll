NAME           = sdsc-weka
VERSION        = 3.8.3
RELEASE        = 0
PKGROOT        = /opt/weka

SRC_SUBDIR     = weka

SOURCE_NAME    = weka
SOURCE_SUFFIX  = zip
SOURCE_VERSION = 3-8-3
SOURCE_PKG     = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR     = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

ZIP_PKGS       = $(SOURCE_PKG)

RPM.EXTRAS     = AutoReq:No\nAutoProv:No
RPM.PREFIX     = $(PKGROOT)
