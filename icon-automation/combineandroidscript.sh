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


# 2 : creating flavour into build.gradle

build_gradle_file="/d/Android_Projects/ydlcustomerappflutterjan2024/android/app/build.gradle"

line_number=$(grep -n '//MARK: - EO Suraj build.gradle Code' "$build_gradle_file" | cut -d: -f1)
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

sed -i "s/betrfit/$1/g" "$temp_file"
sed -i "s/betr.fit/$FC_NAME/g" "$temp_file"

sed -i "${insert_line}r $temp_file" "$build_gradle_file"

echo "File inserted successfully in build.gradle"

rm "$temp_file"

echo "Removed temp file from build.gradle"


# 3 : generating icon from icon kitchen

icon_path=$3

# Check if the icon exists
if [[ ! -f "$icon_path" ]]; then
  echo "Icon not found at: $icon_path"
  exit 1
fi

# Directory setup
dir_path=$(dirname "$icon_path")
new_dir="$dir_path/android_icon"

# Create base output directory
mkdir -p "$new_dir"

# Define icon sizes for each density
declare -A sizes=(
  ["mdpi"]=48
  ["hdpi"]=72
  ["xhdpi"]=96
  ["xxhdpi"]=144
  ["xxxhdpi"]=192
)

# Generate icons for each sizes

for dpi in "${!sizes[@]}"; do
  base_size=${sizes[$dpi]}
  extended_size=$(( base_size * 9 / 4 )) 

  dpi_dir="$new_dir/mipmap-$dpi"
  mkdir -p "$dpi_dir"

  # Generate base icon
  magick "$icon_path" -resize "${base_size}x${base_size}" "$dpi_dir/ic_launcher.png"

  # Generate extended icons
  for variant in foreground background monochrome; do
    magick "$icon_path" -resize "${extended_size}x${extended_size}" "$dpi_dir/ic_launcher_$variant.png"
    
  done

done

echo "All icons generated successfully"


# 4 : copying and replacing folder

source_dir="$new_dir"
dest_dir="$new_folder/res"
background_icons="/D/icon-automation/mipmap-background"

mkdir -p "$dest_dir"

cp -r "$source_dir/"* "$dest_dir/"

echo "all directories copied to $dest_dir"


# 5 : copying and replacing background icons

mkdir -p "$background_icons"

cp -r "$background_icons/"* "$dest_dir/"

echo "background icon replaced successfully"


# to run : ./script-name <folder name> <FC_name> <icon-path>