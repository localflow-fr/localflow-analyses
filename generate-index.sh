#!/bin/bash

# Configuration
ANALYSES_DIR="analyses"
INDEX_FILE="index.json"
README_FILE="README.md"
TEMP_INDEX="index.tmp.json"

if [ ! -d "$ANALYSES_DIR" ]; then
    echo "❌ Directory $ANALYSES_DIR not found."
    exit 1
fi

echo "[]" > $TEMP_INDEX
echo "🚀 Generating index with tags..."

for file in "$ANALYSES_DIR"/*.json; do
    [ -e "$file" ] || continue
    filename=$(basename "$file")
    
    title=$(jq -r '.title // "Untitled Analysis"' "$file")
    description=$(jq -r '.description // "No description provided."' "$file")
    
    # Extract tags as a JSON array (defaults to empty array)
    tags=$(jq -c '.tags // []' "$file")
    
    # Author parsing logic
    raw_owner=$(jq -r '.ownerId // "Community"' "$file" | cut -d'@' -f1)
    author=$(echo "$raw_owner" | sed 's/\./ /g' | awk '{for(i=1;i<=NF;i++)sub(/./,toupper(substr($i,1,1)),$i)}1')
    
    last_mod=$(date -r "$file" +"%Y-%m-%d")

    echo "  - Processing: $title (Tags: $tags)"

    # Append to temporary JSON array including tags
    jq --arg name "$title" \
       --arg file "$filename" \
       --arg desc "$description" \
       --arg auth "$author" \
       --arg date "$last_mod" \
       --argjson tags "$tags" \
       '. += [{name: $name, filename: $file, description: $desc, author: $auth, lastModified: $date, tags: $tags}]' \
       $TEMP_INDEX > tmp.json && mv tmp.json $TEMP_INDEX
done

mv $TEMP_INDEX $INDEX_FILE
echo "✅ $INDEX_FILE generated."

# 2. Update README.md
echo "📝 Updating $README_FILE..."

# Create the new # Analyses section content
NEW_SECTION="# Analyses\n\n| Name | Description | Tags | Author | Last Update |\n| :--- | :--- | :--- | :--- | :--- |\n"
NEW_SECTION+=$(jq -r '.[] | "| **\(.name)** | \(.description) | \(.tags | map("`" + . + "`") | join(" ")) | \(.author) | \(.lastModified) |"' $INDEX_FILE)

# Create a temporary version of the README without the old Analyses section
# Then append the new section and overwrite the original
sed '/^# Analyses/,$d' "$README_FILE" > "$README_FILE.tmp"
echo -e "$NEW_SECTION" >> "$README_FILE.tmp"
mv "$README_FILE.tmp" "$README_FILE"

echo "✅ $README_FILE updated."