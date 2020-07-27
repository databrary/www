#!/bin/sh
git config --global user.name "$GITHUB_ACTOR"
git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"
cd /build/www
make update-repos
echo $INPUT_GITHUB_TOKEN $GITHUB_SHA
INPUT_GITHUB_TOKEN=$INPUT_GITHUB_TOKEN GITHUB_SHA=$GITHUB_SHA make $1