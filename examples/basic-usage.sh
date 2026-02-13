#!/bin/bash

# Basic Usage Examples for Excel Inspector
# =========================================

echo "📊 Excel Inspector - Basic Usage Examples"
echo "=========================================="
echo ""

# Example 1: Simple inspection
echo "1️⃣  Inspecting entire workbook..."
echo "   Command: excel-inspector sample.xlsx"
echo ""
# Uncomment to run:
# excel-inspector sample.xlsx

# Example 2: Headers only (structure preview)
echo "2️⃣  Getting structure only (no data)..."
echo "   Command: excel-inspector sample.xlsx --headers-only"
echo ""
# Uncomment to run:
# excel-inspector sample.xlsx --headers-only

# Example 3: Specific sheet
echo "3️⃣  Extracting specific sheet..."
echo "   Command: excel-inspector sample.xlsx --sheet 'Products'"
echo ""
# Uncomment to run:
# excel-inspector sample.xlsx --sheet "Products"

# Example 4: Limited rows
echo "4️⃣  Preview first 10 rows..."
echo "   Command: excel-inspector sample.xlsx --limit 10"
echo ""
# Uncomment to run:
# excel-inspector sample.xlsx --limit 10

# Example 5: Save to file
echo "5️⃣  Saving output to JSON file..."
echo "   Command: excel-inspector sample.xlsx > output.json"
echo ""
# Uncomment to run:
# excel-inspector sample.xlsx > output.json
# echo "   ✓ Saved to output.json"

# Example 6: Raw output (single line)
echo "6️⃣  Raw output for piping..."
echo "   Command: excel-inspector sample.xlsx --raw"
echo ""
# Uncomment to run:
# excel-inspector sample.xlsx --raw

echo "✅ Examples completed!"
echo ""
echo "💡 Tip: Uncomment the commands in this script to actually run them"
echo "📝 Edit this file: examples/basic-usage.sh"
