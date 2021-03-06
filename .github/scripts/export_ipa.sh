#!/bin/bash

set -eo pipefail

xcodebuild -archivePath $PWD/build/MVVMExercise.xcarchive \
            -exportOptionsPlist MVVMExercise/exportOptions.plist \
            -exportPath $PWD/build \
            -allowProvisioningUpdates \
            -exportArchive | xcpretty