#!/bin/sh
git config --global user.name "$GITHUB_ACTOR"
git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"
cd /build/www
GITHUB_SHA=$GITHUB_SHA INPUT_GITHUB_TOKEN=$INPUT_GITHUB_TOKEN make $1