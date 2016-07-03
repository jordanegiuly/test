#!/bin/bash

TRAVIS_BRANCH="master"

if [ "$TRAVIS_BRANCH" != "master" ];
then
	echo 'No predeploy to do.'
	exit 0
fi

PACKAGE_VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | tr -d '[[:space:]]')

NEW_TAG="v"$PACKAGE_VERSION
echo $NEW_TAG

LAST_TAG=$(git describe --tags --abbrev=0)
COMMIT_LIST=$(git log $LAST_TAG..HEAD --pretty=oneline)
COMMIT_LIST=$'commits:\n'$COMMIT_LIST

git tag $NEW_TAG -m "$COMMIT_LIST"
git push origin $NEW_TAG
exit 0

# if [[ -z "$1" ]];
# then
# 	echo "Please provide a new tag argument: major, minor, patch."
# 	exit 1
# fi

# RELEASE="$1"
# if [ $RELEASE != "major" ] && [ $RELEASE != "minor" ] && [ $RELEASE != "patch" ];
# then
# 	echo "You should provide with a new tag argument: major, minor or patch."
# 	echo "Provided argument: $RELEASE"
# 	exit 1
# fi



# NEW_TAG=$(npm version $RELEASE -m "release v%s")
# git push
# git tag $NEW_TAG $NEW_TAG -f -m "$COMMIT_LIST"
# git push origin $NEW_TAG
# exit 0

# merge on master


# - release tag

# -- install
# - npm install
# - sequelize
# - npm build

# -- run
# - forever run
