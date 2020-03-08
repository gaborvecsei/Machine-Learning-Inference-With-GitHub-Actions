#!/bin/sh

# Make a comment on an Issue.
# Env vars which needs to be set.
# - GITHUB_TOKEN (This can be accessed as: ${{ secrets.GITHUB_TOKEN }})
# - GITHUB_REPOSITORY (This is automatically created in Github Actions)
# $ issue_comment.sh <<Text Comment>> <<Issue number>>

MESSAGE=$1
echo "Message: ${MESSAGE}"
ISSUE_NUMBER=$2
echo "Issue Number: ${ISSUE_NUMBER}"

URI=https://api.github.com
CONTENT_TYPE_HEADER="Content-Type: application/json"
AUTH_HEADER="Authorization: token ${GITHUB_TOKEN}"

# https://developer.github.com/v3/issues/comments/#create-a-comment
curl -X POST -sSL \
    -d "{\"body\": \"$MESSAGE\"}" \
    -H "${AUTH_HEADER}" \
    -H "${CONTENT_TYPE_HEADER}" \
    "${URI}/repos/${GITHUB_REPOSITORY}/issues/${ISSUE_NUMBER}/comments"