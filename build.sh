#!/bin/bash

if [ -d output ]; then
    echo '➥ Packing...'
    cd output
    tar zcvf ${output_file} **
    
    echo "➥ Commit file [${output_file}]"
    git clone --quiet --branch=deploy https://${GH_TOKEN}@github.com/${REPO_SLUG}.git ${REPO_SLUG} > /dev/null
    mv ${output_file} ${REPO_SLUG}
    cd ${REPO_SLUG}
    git config user.email "travis@travis-ci.org"
    git config user.name "travis-ci"
    git add -f ${output_file}
    git commit -m "[ci skip] release ${output_file}"
    git push -fq origin deploy > /dev/null
else
    echo '➥ Error.'
    exit 1
fi