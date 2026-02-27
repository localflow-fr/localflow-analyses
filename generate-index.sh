#!/bin/bash

# Configuration
ANALYSES_DIR="analyses"
INDEX_FILE="index.json"
README_FILE="README.md"
TEMP_INDEX="index.tmp.json"

echo "[]" > $TEMP_INDEX

echo "🚀 Generating index from $ANALYSES_DIR..."

# 1. Build the index.json
for file in "$ANALYSES_DIR"/*.json; do
    filename=$(basename "$file")
    
    # Extract data using jq
    # We parse the file, then parse the nested string in LocalFlow__Content__c
    name=$(jq -r '.Name' "$file")
    content_json=$(jq -r '.LocalFlow__Content__c' "$file")
    description=$(echo "$content_json" | jq -r '.description')
    author="Community" # Default author, or extract if available
    last_mod=$(date -r "$file" +"%Y-%m-%d")

    echo "  - Processing: $name"

    # Append to temporary JSON array
    jq --arg name "$name" \
       --arg file "$filename" \
       --arg desc "$description" \
       --arg auth "$author" \
       --arg date "$last_mod" \
       '. += [{name: $name, filename: $file, description: $desc, author: $auth, lastModified: $date}]' \
       $TEMP_INDEX > tmp.json && mv tmp.json $TEMP_INDEX
done

mv $TEMP_INDEX $INDEX_FILE
echo "✅ $INDEX_FILE generated."

# 2. Update README.md
echo "📝 Updating $README_FILE..."

# Create the new # Analysis section content
NEW_SECTION="# Analysis\n\n| Name | Description | Author | Last Update |\n| :--- | :--- | :--- | :--- |\n"
NEW_SECTION+=$(jq -r '.[] | "| **\(.name)** | \(.description) | \(.author) | \(.lastModified) |"' $INDEX_FILE)

# Use sed to delete everything from "# Analysis" to the end of file, then append new section
# We create a temporary readme to avoid corruption
sed -i '/^# Analyses/,$d' $README_FILE
echo -e "$NEW_SECTION" >> $README_FILE

echo "✅ $README_FILE updated."