NAME               = weka
VERSION            = 3.7.10
RELEASE            = 0
PKGROOT            = /opt/weka
RPM.EXTRAS         = AutoReq:No

SRC_SUBDIR         = weka

SOURCE_NAME        = $(NAME)
SOURCE_VERSION     = $(VERSION)
SOURCE_SUFFIX      = tgz
SOURCE_PKG         = $(SOURCE_NAME)-$(SOURCE_VERSION).$(SOURCE_SUFFIX)
SOURCE_DIR         = $(SOURCE_PKG:%.$(SOURCE_SUFFIX)=%)

TGZ_PKGS           = $(SOURCE_PKG)

