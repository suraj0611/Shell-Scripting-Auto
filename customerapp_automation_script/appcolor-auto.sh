#!/bin/bash

appcolor_file="/mnt/d/Android_Projects/ydlcustomerappflutterjan2024/lib/utils/app_colors.dart"

new_name=$1
new_name2=$2

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

sed -i "s/fikaFitness/$new_name/g" "$temp_file"
sed -i "s/FikaFitness/$new_name2/g" "$temp_file"

sed -i "${insert_line}r $temp_file" "$appcolor_file"

echo "file append successfully"

rm "$temp_file"

echo "removed temp file"

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

sed -i "s/FikaFitness/$new_name2/g" "$temp_file2"

sed -i "${insert_line2}r $temp_file2" "$appcolor_file"

echo "file append successfully"

rm "$temp_file2"

echo "removed temp file"

