#!/bin/bash

firebase_config_file="/mnt/d/Android_Projects/ydlcustomerappflutterjan2024/lib/firebase_config.dart"

new_name=$1

line_number=$(grep -n '//MARK: - EO Suraj Firebase Config Code' "$firebase_config_file" | cut -d: -f1)

if [ -z "$line_number" ]; then
  echo "Line not found in app_String"
  exit 1
fi

insert_line=$((line_number - 1))

temp_file=$(mktemp)

cat > "$temp_file" <<END
  case AppString.fikaFitnessPackageName:
        AppColors.getColors(packageName);
        AppHelper.getAppFeature(packageName);
        if (kIsWeb) {
          //Web
          options = const FirebaseOptions(
              apiKey: "AIzaSyAuVgTgvVKY3zoiUYAuHJZM7dLjeoGgDvg",
              authDomain: "fika-fitness-studio-69e49.firebaseapp.com",
              projectId: "fika-fitness-studio-69e49",
              storageBucket: "fika-fitness-studio-69e49.appspot.com",
              messagingSenderId: "906979828238",
              appId: "1:906979828238:web:218d208ef2269877d1525f",
              measurementId: "G-W2BK1D55MJ"
          );
        } else if (Platform.isIOS || Platform.isMacOS) {
          // iOS and MacOS
          options = const FirebaseOptions(
              apiKey: "AIzaSyAuVgTgvVKY3zoiUYAuHJZM7dLjeoGgDvg",
              authDomain: "fika-fitness-studio-69e49.firebaseapp.com",
              projectId: "fika-fitness-studio-69e49",
              storageBucket: "fika-fitness-studio-69e49.appspot.com",
              messagingSenderId: "906979828238",
              appId: "1:906979828238:web:218d208ef2269877d1525f",
              measurementId: "G-W2BK1D55MJ"
          );

        } else {
          //Android
          options = const FirebaseOptions(
              apiKey: "AIzaSyBZheZwkqlE3os6jQEEU_NPibMxzmFZgQM",
              authDomain: "fika-fitness-studio-69e49.firebaseapp.com",
              projectId: "fika-fitness-studio-69e49",
              storageBucket: "fika-fitness-studio-69e49.appspot.com",
              messagingSenderId: "906979828238",
              appId: "1:906979828238:android:b6d5225496d6f8f7d1525f",
              measurementId: "G-W2BK1D55MJ"
          );
        }
        break;
END

sed -i "s/fikaFitness/$new_name/g" "$temp_file"

sed -i "${insert_line}r $temp_file" "$firebase_config_file"

echo "file append successfully"

rm "$temp_file"

echo "removed temp file"


