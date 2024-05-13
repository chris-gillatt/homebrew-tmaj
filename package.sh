#!/bin/bash -e
# Brew package script for GitHub Actions
# Author: C Gillatt | https://github.com/chris-gillatt | Provided under the MIT license 

export APP="tmaj"

mkdir dist
tar cfv dist/"${APP}-0.0.${GITHUB_RUN_NUMBER}.tar.gz" "$APP"

# Generate Ruby file for Brew using the erb template.
erb "${APP}.erb" > "${APP}.rb"

## Commit the new ruby file back to the repository.
git add "${APP}.rb"
# Commit and push files to repo
git commit -m "$APP release 0.0.${GITHUB_RUN_NUMBER}"
git push

gh release create v0.0.${GITHUB_RUN_NUMBER} ./dist/*.tar.gz --title "0.0.${GITHUB_RUN_NUMBER}" --generate-notes
# 