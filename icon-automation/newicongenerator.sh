#!/bin/bash

icon_path=$3

# Check if the icon exists
if [[ ! -f "$icon_path" ]]; then
  echo "Icon not found at: $icon_path"
  exit 1
fi

# Directory setup
dir_path=$(dirname "$icon_path")
output_dir="$dir_path/android_icon"

# Create base output directory
mkdir -p "$output_dir"

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

  dpi_dir="$output_dir/mipmap-$dpi"
  mkdir -p "$dpi_dir"

  # Generate base icon
  magick "$icon_path" -resize "${base_size}x${base_size}" "$dpi_dir/ic_launcher.png"

  # Generate extended icons
  for variant in foreground background monochrome; do
    magick "$icon_path" -resize "${extended_size}x${extended_size}" "$dpi_dir/ic_launcher_$variant.png"
    
  done

done

echo "All icons generated successfully in: $output_dir"
