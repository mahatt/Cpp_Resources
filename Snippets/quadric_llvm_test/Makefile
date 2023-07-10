
#LLVM_CONFIG=/mnt/c/UbuntuWork/Projects/repo/llvm/build/bin/llvm-config
LLVM_CONFIG=llvm-config
CXX=clang

CXXFLAGS:=`$(LLVM_CONFIG) --cppflags` -g -fPIC -fvisibility-inlines-hidden -Werror=date-time  -std=c++17 -Wall -Wcast-qual -Wmissing-field-initializers -pedantic -Wno-long-long -Wnon-virtual-dtor -Wdelete-non-virtual-dtor -ffunction-sections -fdata-sections -O3 -fno-exceptions -fno-rtti -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS
LDFLAGS:=`$(LLVM_CONFIG) --ldflags`

all: CXXFLAGS := $(CXXFLAGS) -D_DEBUG

all: LoopMetadataPass.so

all-debug-off: CXXFLAGS := $(CXXFLAGS) -DNDEBUG

all-debug-off: LoopMetadataPass.so

LoopMetadataPass.so:LoopMetadataPass.o
		$(CXX) -shared $^ -o $@ -fPIC $(CXXFLAGS) $(LDFLAGS)

LoopMetadataPass.o: LoopMetadata/LoopMetadataPass.cpp
		$(CXX) -c $^ -o $@ $(CXXFLAGS)

clean:
		rm -f *.o *.s
