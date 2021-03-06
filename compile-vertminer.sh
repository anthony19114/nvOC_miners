#!/bin/bash

echo "Checking if bn.h bignum error is fixed for compiling miners or not"
if [ -e  /home/m1/Downloads/openssl-1.0.1e/bn.h.backup ]
then
  echo "bn.h openssl already fixed for compiling miners"
else
  cd /home/m1/Downloads
  wget http://www.openssl.org/source/openssl-1.0.1e.tar.gz
  tar -xvzf openssl-1.0.1e.tar.gz
  cp /usr/local/include/openssl/bn.h /home/m1/Downloads/openssl-1.0.1e/bn.h.backup
  sudo cp /home/m1/Downloads/openssl-1.0.1e/crypto/bn/bn.h /usr/local/include/openssl/
  echo "bn.h openssl fixed for compiling miners"
fi
sleep 1
echo ""

echo "Compiling Vertminer"
echo " This could take a while ..."
cd /home/m1/vertminer
/home/m1/vertminer/autogen.sh
/home/m1/vertminer/configure
/home/m1/vertminer/build.sh

sleep 1
echo ""
echo "Finished compiling vertminer"
