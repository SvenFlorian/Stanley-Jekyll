#!/bin/bash

currentBranch=$(git symbolic-ref --short HEAD);
branchToPushSiteTo="gh-pages";

if [ "source" == "$currentBranch" ]; then
# Build the site
jekyll build;
echo "Built site with Jekyll"
git checkout -b tmp;

# delete everything except _site
rm -rf $(ls * | grep -v _site);
rm -f .gitignore;
git checkout $branchToPushSiteTo -- .gitignore;
git add .;
git add -u .;
git commit -m "Updated site";
git checkout $branchToPushSiteTo;
rm -r *;
git checkout tmp -- _site;
for file in _site/*
do
cp -r $file ./ ;
done
rm -r _site;
git add .;
git add -u .;
git commit -m "Updated site";
git branch -D tmp;
git push origin $branchToPushSiteTo;
git checkout source;

echo "Page updated"

fi