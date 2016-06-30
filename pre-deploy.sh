#!/bin/bash
# TODO: argument patch

RELEASE="$1"
if [ $RELEASE != "major" ] && [ $RELEASE != "minor" ] && [ $RELEASE != "patch" ];
then
	echo "You should provide with a new tag argument: major, minor or patch."
	echo "Provided argument: $RELEASE"
	exit 1
fi

npm version $RELEASE -m "release v%s"
# git push

exit 0
