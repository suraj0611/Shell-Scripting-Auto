#!/bin/bash

icon_path=$1
dir_path=$(dirname "$icon_path")

new_dir="$dir_path/android_icon"

if [[ ! -f "$icon_path" ]]
then 
echo "icon not found"
exit 1
fi

# Define sizes for Android mipmap directories (associative array)
declare -A sizes=(
  ["mdpi"]=48
  ["hdpi"]=72
  ["xhdpi"]=96
  ["xxhdpi"]=144
  ["xxxhdpi"]=192
)

echo "Generating Android icons in: $dir_path"
echo "Using source image: $icon_path"

for dpi in "${!sizes[@]}"; do
  size=${sizes[$dpi]}
  output_dir="$new_dir/mipmap-$dpi"
  output_file="$output_dir/ic_launcher.png"

  mkdir -p "$output_dir"

  magick "$icon_path" -resize ${size}x${size} "$output_file"
  echo "Created $output_file (${size}x${size})"
done

echo "All Android icons generated successfully!"