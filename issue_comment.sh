#!/bin/sh

# Make a comment on an Issue.
# Env vars which needs to be set.
# - GITHUB_TOKEN (This can be accessed as: ${{ secrets.GITHUB_TOKEN }})
# - GITHUB_REPOSITORY (This is automatically created in Github Actions)
# $ issue_comment.sh <<Text Comment>> <<Issue number>>

MESSAGE=$1
ISSUE_NUMBER=$2

URI=https://api.github.com
API_VERSION=v3
API_HEADER="Accept: application/vnd.github.${API_VERSION}+json"
AUTH_HEADER="Authorization: token ${GITHUB_TOKEN}"

# Create a comment with APIv3 # POST /repos/:owner/:repo/issues/:issue_number/comments
curl -XPOST -sSL \
    -d "{\"body\": \"$MESSAGE\"}" \
    -H "${AUTH_HEADER}" \
    -H "${API_HEADER}" \
    "${URI}/repos/${GITHUB_REPOSITORY}/issues/${ISSUE_NUMBER}/comments"