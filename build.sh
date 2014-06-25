#!/bin/bash

fis release -Doumpd output
if [ -d output ]; then
    cd output
    output_file=`date +%Y.%m.%d-%H.%M.%S`.tar.gz
    tar zcvf ${output_file} **
    mv ${output_file} ..
    cd ..
    rm -rf output
else
    echo ' error.'
    exit 1
fi