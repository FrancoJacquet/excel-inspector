#!/bin/bash

# Data Pipeline Example - Process Multiple Excel Files
# ====================================================

echo "🔄 Excel Inspector - Data Pipeline Example"
echo "==========================================="
echo ""

# Configuration
INPUT_DIR="./excel-files"
OUTPUT_DIR="./json-output"

echo "Input directory: $INPUT_DIR"
echo "Output directory: $OUTPUT_DIR"
echo ""

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Check if input directory exists
if [ ! -d "$INPUT_DIR" ]; then
  echo "⚠️  Input directory '$INPUT_DIR' not found"
  echo "   Creating example structure..."
  mkdir -p "$INPUT_DIR"
  echo "   Please add .xlsx files to: $INPUT_DIR"
  exit 1
fi

# Count Excel files
EXCEL_COUNT=$(find "$INPUT_DIR" -name "*.xlsx" -o -name "*.xlsm" | wc -l)

if [ $EXCEL_COUNT -eq 0 ]; then
  echo "⚠️  No Excel files found in $INPUT_DIR"
  exit 1
fi

echo "📊 Found $EXCEL_COUNT Excel file(s)"
echo ""

# Process each Excel file
PROCESSED=0
FAILED=0

for file in "$INPUT_DIR"/*.xlsx "$INPUT_DIR"/*.xlsm; do
  # Skip if no files matched
  [ -e "$file" ] || continue
  
  filename=$(basename "$file")
  basename="${filename%.*}"
  output_file="$OUTPUT_DIR/${basename}.json"
  
  echo "Processing: $filename"
  
  # Run excel-inspector
  if excel-inspector "$file" > "$output_file" 2>/dev/null; then
    echo "  ✓ Saved to: $output_file"
    PROCESSED=$((PROCESSED + 1))
  else
    echo "  ✗ Failed to process $filename"
    FAILED=$((FAILED + 1))
  fi
  
  echo ""
done

# Summary
echo "========================================"
echo "📊 Pipeline Summary"
echo "========================================"
echo "✓ Successfully processed: $PROCESSED"
echo "✗ Failed: $FAILED"
echo "📁 Output directory: $OUTPUT_DIR"
echo ""

# Optional: Create combined index
echo "Creating index file..."
INDEX_FILE="$OUTPUT_DIR/_index.json"

echo "[" > "$INDEX_FILE"
first=true
for file in "$OUTPUT_DIR"/*.json; do
  [ -e "$file" ] || continue
  [ "$(basename "$file")" = "_index.json" ] && continue
  
  if [ "$first" = true ]; then
    first=false
  else
    echo "," >> "$INDEX_FILE"
  fi
  
  cat "$file" >> "$INDEX_FILE"
done
echo "]" >> "$INDEX_FILE"

echo "✓ Created index: $INDEX_FILE"
echo ""
echo "✅ Pipeline completed!"
