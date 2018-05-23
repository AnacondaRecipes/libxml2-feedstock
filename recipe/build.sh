#!/bin/bash

./autogen.sh

./configure --prefix="${PREFIX}" \
            --build=$BUILD \
            --host=$HOST \
            --with-iconv="${PREFIX}" \
            --with-zlib="${PREFIX}" \
            --with-icu \
            --with-lzma="${PREFIX}" \
            --without-python
make -j${CPU_COUNT} ${VERBOSE_AT}
if [[ ${target_platform} != osx-64 ]]; then
  make check $VERBOSE_AT}
fi
make install
