#!/bin/bash

branch=$(git symbolic-ref --short HEAD)

if [ "source" == "$branch" ]; then
    # Do something
    jekyll build
# should add check here if everything is committed
    git checkout -b tmp

# delete everything except _site
rm -rf $(ls * | grep -v _site)
rm -f .gitignore
git checkout master -- .gitignore
git add .
git add -u .
git commit -m "Updated site"
git checkout master
rm -r *
git checkout tmp -- _site
for file in _site/*
do
    cp -r $file ./
done
rm -r _site
git add .
git add -u .
git commit -m "Updated site"
git branch -D tmp
git push origin master
git checkout source

fi