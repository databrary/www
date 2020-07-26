cd /build/www
deploy_branch=gh-pages
deploy_directory=output/databrary
repo=origin
commit_message="Deploy update from $GITHUB_SHA"
REPOSITORY=databrary/www
remote_repo="https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${REPOSITORY}.git"

mkdir -p $deploy_directory
git worktree add -B $deploy_branch $deploy_directory $repo/$deploy_branch
make generate SITE=databrary
cd "$deploy_directory"
git add --all
git commit -m "$commit_message"
git push "${remote_repo}" $deploy_branch
cd /build/www
rm -rf $(dirname $deploy_directory)
git worktree prune