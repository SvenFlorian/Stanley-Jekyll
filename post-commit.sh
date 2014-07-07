#!/bin/bash

branch=$(git symbolic-ref --short HEAD)

if [ "source" == "$branch" ]; then
echo "in the loop"
# Do something
jekyll build;
echo "Built site with Jekyll"
# should add check here if everything is committed
git checkout -b tmp;

# delete everything except _site
rm -rf $(ls * | grep -v _site);
ls
rm -f .gitignore;
git checkout gh-pages -- .gitignore;
git add .;
git add -u .;
git commit -m "Updated site";
git checkout gh-pages;
rm -r *;
git checkout tmp -- _site;
ls
for file in _site/*
do
cp -r $file ./ ;
echo "Copying $file"
done
rm -r _site;
git add .;
git add -u .;
git commit -m "Updated site";
git branch -D tmp;
git push origin gh-pages;
git checkout source;

echo "Page updated"

fi