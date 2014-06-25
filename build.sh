#!/bin/bash

if [ -d output ]; then
    echo '➥ Packing...'
    cd output
    tar zcvf ${output_file} **
    mv ${output_file} ..
    cd ..
    rm -rf output
    
    echo "➥ Commit file [${output_file}]"
    git clone --quiet --branch=deploy https://${GH_TOKEN}@github.com/fouber/ci-test deploy > /dev/null
    mv ${output_file} deploy
    cd deploy
    git config user.email "travis@travis-ci.org"
    git config user.name "travis-ci"
    git add ${output_file}
    git commit -m "release ${output_file}"
    git push origin deploy
else
    echo '➥ Error.'
    exit 1
fi