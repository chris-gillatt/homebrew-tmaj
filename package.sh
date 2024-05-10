#!/bin/bash -ex
# Brew package script

announce () {
  echo "$(basename "$0"): $@"
} # End announce

announce "-----ENV------"
env | sort
announce "-----END ENV------"

git config --global user.email "$USER_EMAIL"
git config --global user.name "$ORG"

announce "-----GIT CONFIG------"
git config --list
announce "-----END GIT CONFIG------"

announce "$USER_NAME"

export APP="tmaj"
REPO_NAME="tmaj"

export RELEASE_COUNT="$GITHUB_RUN_NUMBER"
GIT_REVISION=$(git rev-parse HEAD)

BRANCH="main"

# Compress new version and place in tars directory
mkdir tars
tar cvf tars/"${APP}-0.0.${RELEASE_COUNT}.tar.gz" "$APP"

# Generate Ruby file for Brew using template
erb "${APP}.erb" > "${APP}.rb"

## Git Tasks
git add "${APP}.rb"
# Commit and push files to repo
git commit -m "Push $APP Release 0.0.${RELEASE_COUNT}"
announce "-----GIT STATUS------"
git status
announce "-----END GIT status------"
announce "Path to push: https://${ORG}:${USER_PASSWORD}@github.com/${ORG}/${REPO_NAME}.git $BRANCH"
git push "https://${ORG}:${USER_PASSWORD}@github.com/${ORG}/${REPO_NAME}.git $BRANCH"

# Publish go cli binaries
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

announce "Creating release.."

NEW_RELEASE_RESPONSE=$(curl --silent \
                            --write-out "\n%{http_code}" \
                            -u "$ORG:$USER_PASSWORD" \
                            -H "Accept: application/json" \
                            -H "Content-Type:application/json" \
                            -X POST "https://api.github.com/repos/${ORG}/${REPO_NAME}/releases" \
                            --data "$(post_release_json)")
STATUS_CODE=$(echo "$NEW_RELEASE_RESPONSE" | tail -n 1)
NEW_RELEASE=$(echo "$NEW_RELEASE_RESPONSE" | sed '$d')

if [[ $STATUS_CODE -ge 400 ]]; then
  announce 'ERROR: Failed to create release'
  announce "$STATUS_CODE"
  announce "$NEW_RELEASE"
  exit 1
fi

announce "Release created"

UPLOAD_URL=$(echo "$NEW_RELEASE" | jq -r .upload_url | cut -f1 -d"{")

announce "Uploading binaries"

curl --fail \
     -u "${ORG}:${USER_PASSWORD}" \
     -H "Content-Type:application/octet-stream" \
     -X POST "${UPLOAD_URL}?name=${APP}-0.0.${RELEASE_COUNT}.tar.gz" \
     --data-binary "@tars/${APP}-0.0.${RELEASE_COUNT}.tar.gz" \
     | jq -rc '.name + " - " + .url + " - " + .state'

announce "Done."
announce "Release created successfully."
