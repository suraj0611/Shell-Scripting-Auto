#!/bin/bash

# 1 : creating new folder in res folder with content.

original_folder="/D/Android_Projects/ydlcustomerappflutterjan2024/android/app/src/betrfit"
new_folder="/D/Android_Projects/ydlcustomerappflutterjan2024/android/app/src/$1"

if [[ -d "$original_folder" ]]
then
mkdir -p "$new_folder"
echo "new folder created in src folder"
cp -r "$original_folder/"* "$new_folder/"
echo "content copied successfully"
else
echo "cannot create new folder"
exit 1
fi
