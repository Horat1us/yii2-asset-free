#/bin/bash

BOWER_PATH=$(pwd)/vendor/bower-asset/
VENDOR_PATH=$(dirname $BOWER_PATH)

if [ -d "$VENDOR_PATH" ]; then
  echo "removing $VENDOR_PATH"
  rm -rf $VENDOR_PATH
fi

echo "installing dependencies"
composer install -q
if [ -d "$BOWER_PATH" ];
then
  echo "found bower-asset installed on path $BOWER_PATH" >&2
  exit 1
else
  echo "bower-asset is not installed."
  exit 0
fi
