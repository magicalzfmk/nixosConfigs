#!/usr/bin/env bash

# Usage: ./collect.sh [folder] [output_file]
# Defaults: current directory, output.txt

TARGET="${1:-.}"
OUTPUT="${2:-output.txt}"

# Text-based file extensions to collect
EXTENSIONS="nix lua toml yaml yml json sh bash zsh fish conf cfg ini md txt vim el py js ts css html xml"

# Clear or create output file
> "$OUTPUT"

# Build the -name pattern for find
build_name_pattern() {
  local first=true
  local patterns=()
  for ext in $EXTENSIONS; do
    patterns+=("-o" "-name" "*.${ext}")
  done
  # Remove leading -o
  echo "${patterns[@]:1}"
}

echo "Collecting files from: $(realpath "$TARGET")"
echo "Output: $(realpath "$OUTPUT")"
echo ""

count=0

# Find all matching files, sorted by path
while IFS= read -r filepath; do
  filename=$(basename "$filepath")
  relpath="${filepath#./}"

  echo ">> $relpath"

  {
    echo "================================================================"
    echo "FILE: $filename"
    echo "PATH: $relpath"
    echo "----------------------------------------------------------------"
    cat "$filepath"
    echo ""
    echo ""
  } >> "$OUTPUT"

  ((count++))

done < <(cd "$TARGET" && find . \( \
  -name "*.nix" \
  -o -name "*.lua" \
  -o -name "*.toml" \
  -o -name "*.yaml" \
  -o -name "*.yml" \
  -o -name "*.json" \
  -o -name "*.sh" \
  -o -name "*.bash" \
  -o -name "*.zsh" \
  -o -name "*.fish" \
  -o -name "*.conf" \
  -o -name "*.cfg" \
  -o -name "*.ini" \
  -o -name "*.md" \
  -o -name "*.txt" \
  -o -name "*.vim" \
  -o -name "*.el" \
  -o -name "*.py" \
  -o -name "*.js" \
  -o -name "*.ts" \
  -o -name "*.css" \
  -o -name "*.html" \
  -o -name "*.xml" \
  \) -type f | sort)

echo ""
echo "Done. $count files collected into: $OUTPUT"
