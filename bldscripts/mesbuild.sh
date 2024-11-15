#!/bin/bash

#
# SPDX-FileCopyrightText: 2024 Duncan Greatwood
#
# SPDX-License-Identifier: Apache-2.0
#

# Execute this script from the parent directory by invoking:
#   bldscripts/mesbuild.sh

source bldscripts/messetdirvars.sh

if [ -e "./${MESON_BUILD_DIR}" ]
then
    echo "Using existing build dir ${MESON_BUILD_DIR}"
else
    meson setup ${MESON_BUILD_DIR} \
    --buildtype=release \
    -DPISTACHE_USE_SSL=true \
    -DPISTACHE_BUILD_EXAMPLES=true \
    -DPISTACHE_BUILD_TESTS=true \
    -DPISTACHE_BUILD_DOCS=false \
    -DPISTACHE_USE_CONTENT_ENCODING_DEFLATE=true \
    -DPISTACHE_USE_CONTENT_ENCODING_ZSTD=true \
    --prefix="${MESON_PREFIX_DIR}" \
#    -DPISTACHE_FORCE_LIBEVENT=true
    
fi

meson compile -C ${MESON_BUILD_DIR}

