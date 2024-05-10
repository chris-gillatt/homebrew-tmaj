#!/bin/bash -e
# Brew package script

announce () {
  echo "$(basename "$0"): $@"
} # End announce

# announce "-----ENV------"
# env | sort
# announce "-----END ENV------"

# announce "Set Git Config"
# git config --global user.name "$CG_GIT_USERNAME"
# git config --global user.email "$CG_GIT_EMAIL"


# git config user.name "github-actions[bot]"
# git config user.email "41898282+github-actions[bot]@users.noreply.github.com"

# echo 
# announce "-----GIT CONFIG------"
# git config --list | sort 
# announce "-----END GIT CONFIG------"
# echo 

export APP="tmaj"
REPO_NAME="tmaj"
# BRANCH="main"

#export RELEASE_COUNT="$GITHUB_RUN_NUMBER"
GIT_REVISION=$(git rev-parse HEAD)

# Compress new version and place in tars directory
mkdir -v tars
tar cvf tars/"${APP}-0.0.${GITHUB_RUN_NUMBER}.tar.gz" "$APP"

# Generate Ruby file for Brew using template
erb "${APP}.erb" > "${APP}.rb"

# announce "-----Ruby file------"
# ls -l "${APP}.rb"
# announce "-----End Ruby file------"

## Git Tasks
git add "${APP}.rb"
# Commit and push files to repo
git commit -m "$APP release 0.0.${GITHUB_RUN_NUMBER}"
# announce "-----GIT STATUS------"
# git status
# announce "-----END GIT status------"

# announce "-----GIT remote------"
# git remote -v
# announce "-----END GIT remote------"

git push # https://${CG_GITHUB_USERNAME}:${CG_GITHUB_PAT}@github.com/${CG_ORG}/tmaj.git ${BRANCH}

# Publish go cli binaries
post_release_json()
{
  cat <<EOF
{
  "tag_name":         "0.0.${GITHUB_RUN_NUMBER}",
  "target_commitish": "${GIT_REVISION}",
  "name":             "0.0.${GITHUB_RUN_NUMBER}"
}
EOF
}

announce "Creating release.."

NEW_RELEASE_RESPONSE=$(curl --silent \
                            --write-out "\n%{http_code}" \
                            -u "$GITHUB_ACTOR:$CG_GITHUB_PAT" \
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
     -u "${GITHUB_ACTOR}:${CG_GITHUB_PAT}" \
     -H "Content-Type:application/octet-stream" \
     -X POST "${UPLOAD_URL}?name=${APP}-0.0.${GITHUB_RUN_NUMBER}.tar.gz" \
     --data-binary "@tars/${APP}-0.0.${GITHUB_RUN_NUMBER}.tar.gz" \
     | jq -rc '.name + " - " + .url + " - " + .state'

announce "Done."
announce "Release created successfully."
