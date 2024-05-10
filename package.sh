#!/bin/bash -e
# Brew package script for GitHub Actions
# Author: C Gillatt

# Prefix log output with the name of the script for easy identification.
announce () {
  echo "$(basename "$0"): $*"
} # End announce

announce "Starting up!"

# Set app and Repository name here
export APP="tmaj"
REPO_NAME="tmaj"

# Use the GitHub Actions Run number for versioning
export RELEASE_COUNT="$GITHUB_RUN_NUMBER"
GIT_REVISION=$(git rev-parse HEAD)

# Compress new app version and place in a directory for seperation.
# This is useful when there's several files to package up too.
mkdir -v tars
tar cvf tars/"${APP}-0.0.${RELEASE_COUNT}.tar.gz" "$APP"

# Generate Ruby file for Brew using the erb template
erb "${APP}.erb" > "${APP}.rb"

## Commit the new ruby file back to the repository.
git add "${APP}.rb"
# Commit and push files to repo
git commit -m "$APP release 0.0.${RELEASE_COUNT}"
git push

# Create a json payload to help us create release tags
post_release_json()
{
  cat <<EOF
{
  "tag_name":         "0.0.${RELEASE_COUNT}",
  "target_commitish": "${GIT_REVISION}",
  "name":             "0.0.${RELEASE_COUNT}"
}
EOF
}

announce "Creating release"

NEW_RELEASE_RESPONSE=$(curl --silent \
                            --write-out "\n%{http_code}" \
                            -u "$CG_GITHUB_USERNAME:$CG_GITHUB_PAT" \
                            -H "Accept: application/json" \
                            -H "Content-Type:application/json" \
                            -X POST "https://api.github.com/repos/${CG_ORG}/${REPO_NAME}/releases" \
                            --data "$(post_release_json)")
STATUS_CODE=$(echo "$NEW_RELEASE_RESPONSE" | tail -n 1)
NEW_RELEASE=$(echo "$NEW_RELEASE_RESPONSE" | sed '$d')

if [[ $STATUS_CODE -ge 400 ]]; then
  announce 'ERROR: Failed to create release'
  announce "$STATUS_CODE"
  announce "$NEW_RELEASE"
  exit 1
fi

announce "Release created successfully"

UPLOAD_URL=$(echo "$NEW_RELEASE" | jq -r .upload_url | cut -f1 -d"{")

announce "Uploading binaries"

curl --fail \
     -u "${CG_GITHUB_USERNAME}:${CG_GITHUB_PAT}" \
     -H "Content-Type:application/octet-stream" \
     -X POST "${UPLOAD_URL}?name=${APP}-0.0.${RELEASE_COUNT}.tar.gz" \
     --data-binary "@tars/${APP}-0.0.${RELEASE_COUNT}.tar.gz" \
     | jq -rc '.name + " - " + .url + " - " + .state'

announce "Upload successful"
announce "Script completed successfully!"
