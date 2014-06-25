#!/bin/bash

fis release -Doumpd output
if [ -d output ]; then
    cd output
    output_file=`date +%Y.%m.%d-%H.%M.%S`.tar.gz
    tar zcvf ${output_file} **
    mv ${output_file} ..
    cd ..
    rm -rf output
    git checkout deploy
    git add ${output_file}
    git commit -am "release ${output_file}"
    git push origin deploy
    git checkout master
    rm -f ${output_file}
else
    echo ' error.'
    exit 1
fi