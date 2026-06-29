#!/usr/bin/env bash

set -ex

CODESIGN_ARGS=""
if [ -z "${APPLE_P12_CERTIFICATE:-}" ]; then
  echo "No APPLE_P12_CERTIFICATE provided, building with ad-hoc code signing."
  CODESIGN_ARGS="CODE_SIGN_IDENTITY=- CODE_SIGNING_REQUIRED=NO"
fi

set -o pipefail && xcodebuild -workspace alt-tab-macos.xcworkspace -scheme Release -derivedDataPath DerivedData $CODESIGN_ARGS | scripts/xcbeautify
file "$BUILD_DIR/$XCODE_BUILD_PATH/$APP_NAME.app/Contents/MacOS/$APP_NAME"
