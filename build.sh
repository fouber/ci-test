#!/bin/bash

if [ -d output ]; then
    echo '➥ Packing...'
    cd output
    tar zcvf ${output_file} **
    mv ${output_file} ..
    cd ..
    rm -rf output
    
    echo "➥ Commit file [${output_file}]"
    git config credential.helper "store --file=.git/credentials"
    echo "https://${GH_TOKEN}:@github.com" > .git/credentials
    git clone --depth=50 --branch=deploy https://github.com/fouber/ci-test.git ci-test
    mv ${output_file} ci-test
    cd ci-test
    git add ${output_file}
    git commit -m "release ${output_file}"
    git push origin deploy
else
    echo '➥ Error.'
    exit 1
fi