wget https://www.libssh2.org/download/libssh2-1.7.0.tar.gz
tar -xf libssh2-1.7.0.tar.gz
cd libssh2-1.7.0/
./configure
make
make install
cd ..
wget https://curl.haxx.se/download/curl-7.61.0.tar.gz
tar -xf curl-7.61.0.tar.gz
cd curl-7.61.0/
./configure --with-libssh2=/usr/local
make
make install
cd ..
rm -rf libssh2-1.7.0* curl-7.61.*
echo "Successful! :)"

