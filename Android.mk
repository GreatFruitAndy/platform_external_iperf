LOCAL_PATH		:= $(call my-dir)

include $(CLEAR_VARS)
define all-cpp-files-under
$(patsubst ./%, %, \
  $(shell cd $(LOCAL_PATH) ; \
          find $(1) -name "*.cpp" -and -not -name ".*") \
 )
endef
LOCAL_CFLAGS            := -Wall -DHAVE_CONFIG_H
LOCAL_C_INCLUDES        := $(LOCAL_PATH) \
						   $(LOCAL_PATH)/include \
                           bionic \
                           external/stlport/stlport
LOCAL_SRC_FILES 		:= src/main.cpp \
						   src/Client.cpp \
						   src/Extractor.c \
						   src/gnu_getopt.c \
						   src/gnu_getopt_long.c \
						   src/Launch.cpp \
						   src/List.cpp \
						   src/Listener.cpp \
						   src/Locale.c \
						   src/PerfSocket.cpp \
						   src/ReportCSV.c \
						   src/ReportDefault.c \
						   src/Reporter.c \
						   src/Server.cpp \
						   src/service.c \
						   src/Settings.cpp \
						   src/SocketAddr.c \
						   src/sockets.c \
						   src/stdio.c \
						   src/tcp_window_size.c \
						   compat/delay.cpp \
						   compat/signal.c \
						   compat/error.c \
						   compat/Thread.c \
						   compat/string.c
LOCAL_MODULE_TAGS       := optional
LOCAL_SHARED_LIBRARIES  := libstlport libcutils
LOCAL_MODULE            := iperf
include $(BUILD_EXECUTABLE)