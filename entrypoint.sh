#!/bin/sh
git config --global user.name "$GITHUB_ACTOR"
git config --global user.email "${GITHUB_ACTOR}@users.noreply.github.com"
cd /build/www
make update-repos
make $1