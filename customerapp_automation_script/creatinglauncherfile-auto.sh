#!/bin/bash

original_file="/mnt/d/Android_Projects/ydlcustomerappflutterjan2024/lib/launcher/fika_fitness.dart"
new_file="/mnt/d/Android_Projects/ydlcustomerappflutterjan2024/lib/launcher/$1.dart"
new_name="$2"

if [[ -f "$original_file" ]]
then
touch $new_file
echo "new file created"
cp "$original_file" "$new_file"
echo "file copied successfully"
sed -i "s/fikaFitness/$new_name/g" "$new_file"
echo "old contect replaced by $new_name"
else
echo "file not created"
exit 1
fi