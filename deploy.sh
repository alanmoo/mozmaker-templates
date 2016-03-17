#!/bin/bash

echo 'Deploying Mozmaker Templates...'
git checkout master
git pull mozilla master
rm -rf node_modules
npm i
npm run build
git branch -D gh-pages
git checkout --orphan gh-pages
rm .gitignore
echo 'node_modules/' >> .gitignore
echo '.DS_Store' >> .gitignore
git add .
git commit -m 'AUTOMATED BUILD AND DEPLOY.'
git push mozilla gh-pages -f
echo 'Finished deploying Mozmaker Templates to gh-pages'
git checkout -
