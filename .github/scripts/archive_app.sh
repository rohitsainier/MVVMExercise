#!/bin/bash

set -eo pipefail

xcodebuild -project MVVMExercise.xcodeproj \
            -scheme MVVMExercise \
            -sdk iphoneos \
            -configuration AppStoreDistribution \
            -archivePath $PWD/build/MVVMExercise.xcarchive \
            clean archive | xcpretty