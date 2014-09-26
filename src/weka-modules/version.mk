NAME        = weka-modules
RELEASE     = 1
PKGROOT     = /opt/modulefiles/applications/weka

VERSION_SRC = $(REDHAT.ROOT)/src/weka/version.mk
VERSION_INC = version.inc
include $(VERSION_INC)

RPM.EXTRAS  = AutoReq:No
