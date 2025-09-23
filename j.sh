#!/bin/bash

unset JAVA_HOME                                       &&
bash configure --enable-unlimited-crypto              \
               --disable-warnings-as-errors           \
               --with-stdc++lib=dynamic               \
               --with-giflib=system                   \
               --with-jtreg=/home/leakos/Downloads/jtreg                \
               --with-lcms=system                     \
               --with-libjpeg=system                  \
               --with-libpng=system                   \
               --with-zlib=system                     \
               --with-version-build="8"               \
               --with-version-pre=""                  \
               --with-version-opt=""                  \
               --with-cacerts-file=/etc/pki/tls/java/cacerts &&
make images
