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
    git fetch origin deploy
    git checkout -b deploy
    git add ${output_file}
    git commit -m "release ${output_file}"
    git push origin deploy
    git checkout master
    rm -f ${output_file}
else
    echo '➥ Error.'
    exit 1
fi