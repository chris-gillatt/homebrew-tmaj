#!/bin/bash -e
# Brew package script

announce () {
  echo "$(basename "$0"): $*"
} # End announce

git config user.email "$GIT_USER_EMAIL"
git config user.name "$GIT_USER_NAME"

echo "Git username is $GIT_USER_NAME"

if [ -n "$GIT_USER_EMAIL" ]; then
  echo "git config user.email is set"
else
  echo "Something broke"
fi

export APP="tmaj"
GH_REPO_NAME="tmaj"

export RELEASE_COUNT="$GITHUB_RUN_NUMBER"
GIT_REVISION=$(git rev-parse HEAD)

BRANCH="main"

# Compress new version and place in tars directory
mkdir tars
announce "Files added to tar: "
tar cvf tars/"${APP}-0.0.${RELEASE_COUNT}.tar.gz" "$APP"

# Generate Ruby file for Brew using template
erb "${APP}.erb" > "${APP}.rb"

## Git Tasks
export GIT_TRACE=1
git add "${APP}.rb"
# Commit and push files to repo
git commit -m "Push $APP Release 0.0.${RELEASE_COUNT}" &&
git push "https://${GH_ORG}:${GH_PAT}@github.com/${GH_ORG}/${GH_REPO_NAME}.git" "$BRANCH"

echo "line 37"

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
                            -u "$GH_ORG:$GH_PAT" \
                            -H "Accept: application/json" \
                            -H "Content-Type:application/json" \
                            -X POST "https://api.github.com/repos/${GH_ORG}/${GH_REPO_NAME}/releases" \
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
     -u "${GH_ORG}:${GH_PAT}" \
     -H "Content-Type:application/octet-stream" \
     -X POST "${UPLOAD_URL}?name=${APP}-0.0.${RELEASE_COUNT}.tar.gz" \
     --data-binary "@tars/${APP}-0.0.${RELEASE_COUNT}.tar.gz" \
     | jq -rc '.name + " - " + .url + " - " + .state'

announce "Done."
announce "Release created successfully."
