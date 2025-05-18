#!/bin/bash

appstring_file="/mnt/d/Android_Projects/ydlcustomerappflutterjan2024/lib/utils/app_string.dart"

new_name=$1

line_number=$(grep -n '//MARK: - EO Suraj Code' "$appstring_file" | cut -d: -f1)

if [ -z "$line_number" ]; then
  echo "Line not found in app_String"
  exit 1
fi

insert_line=$((line_number - 1))

temp_file=$(mktemp)

cat > "$temp_file" <<END
  static const String fikaFitness = "Fika Fitness Studio";
  static const String fikaFitnessPackageName = "com.ydl.fikafitnessdtudio";
  static const String fikaFitnessApiKey = "mIa3uayruTc6z6iRkLumoG4G+9BMgX30S4IpKtFMA/4=";
  static const String fikaFitnessLogoAsset = "assets/app_icon/fika_fitness.png";
END

sed -i "s/fikaFitness/$new_name/g" "$temp_file"

sed -i "${insert_line}r $temp_file" "$appstring_file"

echo "file append successfully"

rm "$temp_file"

echo "removed temp file"
