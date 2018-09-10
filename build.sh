#!/bin/bash

if [ "$1" == "ios" ] || [ "$1" == "apk" ]; then
    echo "Start building $1"

    if [ "$APP_BUILD_VERSION" == "" ]; then
        APP_BUILD_VERSION="$(git describe --tags --abbrev=0 | tr -d '[:space:]')"
    fi 

    APP_BUILD_NUMBER="$(git rev-list --count HEAD | tr -d '[:space:]')"

    echo "Version=$APP_BUILD_VERSION, Number=$APP_BUILD_NUMBER"

    flutter build $1 --build-name=$APP_BUILD_VERSION --build-number=$APP_BUILD_NUMBER
else
    echo "The first parameter should be iso or apk"
    exit 1
fi
