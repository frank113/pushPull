# pushPull
An educational tool for classrooms where coding is being taught

This tool allows easy sharing of code between students and teachers, on the fly, via a common sftp account.

See the tops of the .R and .py files for full details.

## Requirements

+ libssh2 (version 1.7)
+ libgcrypt
+ cURL

# Installation

To ensure that you can use the sftp protocol, run the following sequence of commands:

```sh
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
```

After which you must install RCurl from source. This may be done in R with the command:

```r
install.packages("RCurl", type = "source")
```