apt-get update
apt-get -y install autoconf automake git libelf-dev libssl-dev pkg-config clang-5.0 libtool linux-tools-$(uname -r)
cd ..
aclocal -I .; autoheader; autoconf; automake --add-missing -c
CC=clang-5.0 CXX=clang++-5.0 ./configure  --with-llvm=$(which llvm-config-5.0)
make 

