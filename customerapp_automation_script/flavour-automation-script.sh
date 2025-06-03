#!/bin/bash

# ************ 1 : Creating New Dart File In Launcher Folder ************ :


original_file="/d/Android_Projects/ydlcustomerappflutterjan2024/lib/launcher/fika_fitness.dart"
new_file="/d/Android_Projects/ydlcustomerappflutterjan2024/lib/launcher/$1.dart"
new_name="$2"
new_name2="$3"
color_code="$4"

if [[ -f "$original_file" ]]
then
touch $new_file
echo "New file created launcher folder"
cp "$original_file" "$new_file"
echo "file copied in $new_file successfully"
sed -i "s/fikaFitness/$new_name/g" "$new_file"
echo "old contect replaced by $new_name"
else
echo "file not created in launcher folder"
exit 1
fi


# ************ 2 : Inserting Code In app_string File ************ :

appstring_file="/d/Android_Projects/ydlcustomerappflutterjan2024/lib/utils/app_string.dart"


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

echo "temp file created in App_String"

sed -i "s/fikaFitness/$new_name/g" "$temp_file"

sed -i "${insert_line}r $temp_file" "$appstring_file"

echo "File inserted successfully in app_string"

rm "$temp_file"

echo "Removed temp file from app_string"



# ************ 3 : Inserting Code In app_helper File ************ :


apphelper_file="/d/Android_Projects/ydlcustomerappflutterjan2024/lib/utils/app_helper.dart"


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

echo "temp file created in app_helper"

sed -i "s/fikaFitness/$new_name/g" "$temp_file"

sed -i "${insert_line}r $temp_file" "$apphelper_file"

echo "file inserted successfully in app_helper "

rm "$temp_file"

echo "removed temp file from app_helper"


# ************ 4 : Inserting Code In firebase_config File ************ :


firebase_config_file="/d/Android_Projects/ydlcustomerappflutterjan2024/lib/firebase_config.dart"

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

echo "temp file created in firebase_config file"

sed -i "s/fikaFitness/$new_name/g" "$temp_file"

sed -i "${insert_line}r $temp_file" "$firebase_config_file"

echo "file inserted successfully in firebase_config file"

rm "$temp_file"

echo "removed temp file from firebase_config file"



# ************ 5 : Inserting Code In app_colors File ************ :

appcolor_file="/d/Android_Projects/ydlcustomerappflutterjan2024/lib/utils/app_colors.dart"


line_number="$(grep -n '//MARK: - EO Case Suraj Code' "$appcolor_file" | cut -d: -f1)"

if [[ -z "$line_number" ]]
then
echo "line not found in app_color"
exit 1
fi

insert_line=$((line_number - 1))

temp_file=$(mktemp)

cat > "$temp_file" <<END
        case AppString.fikaFitnessPackageName:
        setColorsForFikaFitness();
        break;
END

echo "temp file created in app_colors file"

sed -i "s/fikaFitness/$new_name/g" "$temp_file"
sed -i "s/FikaFitness/$new_name2/g" "$temp_file"

sed -i "${insert_line}r $temp_file" "$appcolor_file"

echo "file inserted successfully in app_helper file"

rm "$temp_file"

echo "removed temp file from app_helper file"

line_number2="$(grep -n '//MARK: - EO Set color Suraj Code' "$appcolor_file" | cut -d: -f1)"

if [[ -z "$line_number2" ]]
then
echo "line not found in app_color"
exit 1
fi

insert_line2=$((line_number2 - 1))

temp_file2=$(mktemp)

cat > "$temp_file2" <<END
        static void setColorsForFikaFitness() {
    AppColors.primaryLightColor = const MaterialColor(0xffFFC410, <int, Color>{
      50: Color(0xffFFC410),
      100: Color(0xffFFC410),
      200: Color(0xffFFC410),
      300: Color(0xffFFC410),
      400: Color(0xffFFC410),
      500: Color(0xffFFC410),
      600: Color(0xffFFC410),
      700: Color(0xffFFC410),
      800: Color(0xffFFC410),
      900: Color(0xffFFC410),
    });

    AppColors.secondaryColor = const MaterialColor(0xffFFC410, <int, Color>{
      50: Color(0xffFFC410),
      100: Color(0xffFFC410),
      200: Color(0xffFFC410),
      300: Color(0xffFFC410),
      400: Color(0xffFFC410),
      500: Color(0xffFFC410),
      600: Color(0xffFFC410),
      700: Color(0xffFFC410),
      800: Color(0xffFFC410),
      900: Color(0xffFFC410),
    });

    AppColors.primaryDarkColor = const MaterialColor(0xff000000, <int, Color>{
      50: Color(0xff000000),
      100: Color(0xff000000),
      200: Color(0xff000000),
      300: Color(0xff000000),
      400: Color(0xff000000),
      500: Color(0xff000000),
      600: Color(0xff000000),
      700: Color(0xff000000),
      800: Color(0xff000000),
      900: Color(0xff000000),
    });

    AppColors.primaryLightSoftColor = const Color(0xffFFC410);
    AppColors.primaryLightMintColor = const Color(0xffffffff);
    dayColor = const Color(0xffffffff);
    backColor = Colors.grey.shade600;
  }
END

echo "temp2 file created in app_colors"

sed -i "s/FikaFitness/$new_name2/g" "$temp_file2"

sed -i "s/0xffFFC410/$color_code/g" "$temp_file2"

sed -i "${insert_line2}r $temp_file2" "$appcolor_file"


echo "file2 inserted successfully in app_colors file"

rm "$temp_file2"

echo "removed temp2 file from app_colors"




