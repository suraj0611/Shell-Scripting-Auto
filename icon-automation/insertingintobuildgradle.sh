#!/bin/bash


build_gradle_file="/d/Android_Projects/ydlcustomerappflutterjan2024/android/app/build.gradle"

line_number=$(grep -n '//MARK: - EO Suraj build.gradle Code' "$build_gradle_file" | cut -d: -f1)
new_name=$1
FC_NAME=$2

if [ -z "$line_number" ]; then
  echo "Line not found in app_String"
  exit 1
fi

insert_line=$((line_number - 1))

temp_file=$(mktemp)

cat > "$temp_file" <<END
  betrfit {
            dimension "customer_app"
            applicationId "com.ydl.betrfit"
            resValue "string", "app_name", "betr.fit"
            manifestPlaceholders.app_name = "betr.fit"
            versionCode 1
            versionName "1.0"
        }
END

echo "temp file created in build.gradle"

sed -i "s/betrfit/$new_name/g" "$temp_file"
sed -i "s/betr.fit/$FC_NAME/g" "$temp_file"

sed -i "${insert_line}r $temp_file" "$build_gradle_file"

echo "File inserted successfully in build.gradle"

rm "$temp_file"

echo "Removed temp file from build.gradle"
