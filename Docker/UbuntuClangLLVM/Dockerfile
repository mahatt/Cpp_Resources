FROM ubuntu:22.10
MAINTAINER Mahesh <mahesh@nowhere.com>

RUN apt-get update
RUN apt-get install -y wget

#  From https://apt.llvm.org/

# Add repo signature
RUN wget -qO- https://apt.llvm.org/llvm-snapshot.gpg.key | tee /etc/apt/trusted.gpg.d/apt.llvm.org.asc

# Add repo source
RUN  printf "deb http://apt.llvm.org/jammy/ llvm-toolchain-jammy-15 main \n deb-src http://apt.llvm.org/jammy/ llvm-toolchain-jammy-15 main" > /etc/apt/sources.list.d/llvm.list 

RUN apt-get update 
# Basic LLVM Runtime libraries and tools  ( Not libclang1-15 )
RUN apt-get install -y clang-15 clang-tools-15 libllvm15  llvm-15-runtime  

# Get Development library Support (libpolly-15-dev)
RUN apt-get install -y llvm-15-dev libclang-15-dev libclang-common-15-dev   

# Get Documentation 
RUN apt-get install -y llvm-15-doc clang-15-doc  

# Get Tools
RUN apt-get install -y clang-format-15 python3-clang-15 clang-tidy-15 lldb-15 lld-15 

# Get Compiler Runtime libraries
#RUN apt-get install -y libclang-rt-15-dev 


# Get LLVM Project Libries  MLIR
RUN apt-get install -y libmlir-15-dev  mlir-15-tools

# Get Other development only libraries
# RUN apt-get install -y libfuzzer-15-dev  libc++-15-dev libc++abi-15-dev libclc-15-dev libunwind-15-dev 
