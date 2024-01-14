#!/bin/bash
set -euxo pipefail

# Builds xcframework from iOS framework template project called MyUIFramework

# Clean build folder
rm -rf ./build

# Archive for iOS
xcodebuild archive -scheme MyUIFramework -destination="iOS" -archivePath ./build/ios.xcarchive -sdk iphoneos SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES | xcpretty

# Archive for simulator
xcodebuild archive -scheme MyUIFramework -destination="iOS Simulator" -archivePath ./build/iossimulator.xcarchive -sdk iphonesimulator SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES | xcpretty

# Build xcframework with two archives
xcodebuild -create-xcframework -framework ./build/ios.xcarchive/Products/Library/Frameworks/MyUIFramework.framework -framework ./build/iossimulator.xcarchive/Products/Library/Frameworks/MyUIFramework.framework -output ./build/MyUIFramework.xcframework