#!/bin/bash

if [ -d output ]; then
    echo '➥ Packing...'
    cd output
    tar zcvf ${output_file} **
    mv ${output_file} ..
    cd ..
    rm -rf output
    
    echo "➥ Commit file [${output_file}]"
    git remote set-url origin https://github.com/${REPO_SLUG}.git
    git config user.email "travis@travis-ci.org"
    git config user.name "travis-ci"
    git fetch origin deploy
    git pull origin deploy
    git checkout -b deploy
    git add ${output_file}
    git commit -m "[ci skip] release ${output_file}"
    git push origin deploy
else
    echo '➥ Error.'
    exit 1
fi