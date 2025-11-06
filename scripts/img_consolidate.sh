#!/bin/bash

# Script to copy images from multiple folders with alphabetical prefixes
# Usage: ./consolidate_images.sh <source_parent_dir> <destination_dir>

# Check if correct number of arguments provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <source_parent_dir> <destination_dir>"
    echo "Example: $0 ./my_folders ./all_images"
    exit 1
fi

SOURCE_DIR="$1"
DEST_DIR="$2"

# Create destination directory if it doesn't exist
mkdir -p "$DEST_DIR"

# Function to generate prefix (aa, ab, ac, ... zz)
generate_prefix() {
    local num=$1
    local first=$((num / 26))
    local second=$((num % 26))
    
    # Convert to ASCII: 97 is 'a'
    local first_char=$(printf "\\$(printf '%03o' $((97 + first)))")
    local second_char=$(printf "\\$(printf '%03o' $((97 + second)))")
    
    echo "${first_char}${second_char}"
}

# Counter for folder prefix
folder_count=0

# Process each folder
for folder in "$SOURCE_DIR"/*/ ; do
    # Skip if not a directory
    [ -d "$folder" ] || continue
    
    # Check if we've exceeded zz (26*26 = 676 folders)
    if [ $folder_count -ge 676 ]; then
        echo "Warning: Exceeded maximum of 676 folders (aa-zz)"
        break
    fi
    
    # Generate prefix for this folder
    prefix=$(generate_prefix $folder_count)
    
    folder_name=$(basename "$folder")
    echo "Processing folder: $folder_name with prefix: $prefix"
    
    # Find and copy all files (regardless of extension)
    file_found=false
    file_count=1
    for file in "$folder"/*; do
        # Skip if not a regular file
        [ -f "$file" ] || continue
        
        file_found=true
        filename=$(basename "$file")
        extension="${filename##*.}"
        
        # If file has no extension, use empty string
        if [ "$extension" = "$filename" ]; then
            new_filename="${prefix}${file_count}"
        else
            new_filename="${prefix}${file_count}.${extension}"
        fi
        
        cp "$file" "$DEST_DIR/$new_filename"
        echo "  Copied: $filename -> $new_filename"
        
        file_count=$((file_count + 1))
    done
    
    if [ "$file_found" = false ]; then
        echo "  No files found in this folder"
    fi
    
    folder_count=$((folder_count + 1))
done

echo ""
echo "Done! Processed $folder_count folders"
echo "Files copied to: $DEST_DIR"