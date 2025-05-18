#!/bin/bash

apphelper_file="/mnt/d/Android_Projects/ydlcustomerappflutterjan2024/lib/utils/app_helper.dart"

new_name=$1

line_number=$(grep -n '//MARK: - EO Default app helper suraj Code' "$apphelper_file" | cut -d: -f1)

if [ -z "$line_number" ]; then
  echo "Line not found in app_helper"
  exit 1
fi

insert_line=$((line_number - 1))

temp_file=$(mktemp)

cat > "$temp_file" <<END
  case AppString.fikaFitnessPackageName:
END

sed -i "s/fikaFitness/$new_name/g" "$temp_file"

sed -i "${insert_line}r $temp_file" "$apphelper_file"

echo "file append successfully"

rm "$temp_file"

echo "removed temp file"
