#!/bin/bash

fis release -Doumpd output
cd output
output_file=`date +%Y.%m.%d-%H.%M.%S`.tar.gz
tar zcvf ${output_file} **
mv ${output_file} ..
cd ..
rm -rf output