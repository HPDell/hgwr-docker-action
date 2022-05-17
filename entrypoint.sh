#!/bin/sh -l

mkdir build
cd build
cmake .. -DWITH_R=ON && \
    cmake --build . --config Release --target hgwrr_rbuild && \
    ctest -R Test_R_hgwr --output-on-failure --verbose
