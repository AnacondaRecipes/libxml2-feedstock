#!/bin/bash

export NOCONFIGURE=1
./autogen.sh

export CFLAGS="${CFLAGS} -DTRUE=1"
export CXXFLAGS="${CXXFLAGS} -DTRUE=1"

./configure --prefix="${PREFIX}" \
            --build=${BUILD} \
            --host=${HOST} \
            --with-iconv="${PREFIX}" \
            --with-zlib="${PREFIX}" \
            --with-icu \
            --with-lzma="${PREFIX}" \
            --without-python \
            --enable-static=no
make -j${CPU_COUNT} ${VERBOSE_AT}

make install

# Remove large documentation files that can take up to 6.6/9.2MB of the install
# size.
# https://github.com/conda-forge/libxml2-feedstock/issues/57
rm -rf ${PREFIX}/share/doc
rm -rf ${PREFIX}/share/gtk-doc
rm -rf ${PREFIX}/share/man