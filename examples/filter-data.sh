#!/bin/bash

# Data Filtering Examples with jq
# ================================

echo "🔍 Excel Inspector + jq - Data Filtering"
echo "========================================"
echo ""

FILE="sample.xlsx"

if [ ! -f "$FILE" ]; then
  echo "⚠️  Sample file '$FILE' not found"
  echo "   Create a sample Excel file first or change FILE variable"
  exit 1
fi

echo "Using file: $FILE"
echo ""

# Example 1: Count rows
echo "1️⃣  Count total rows in Sheet1..."
echo "   Command: excel-inspector $FILE | jq '.sheets.Sheet1.rowCount'"
excel-inspector $FILE | jq '.sheets.Sheet1.rowCount'
echo ""

# Example 2: List all sheets
echo "2️⃣  List all sheet names..."
echo "   Command: excel-inspector $FILE | jq '.metadata.sheets[]'"
excel-inspector $FILE | jq '.metadata.sheets[]'
echo ""

# Example 3: Get column headers
echo "3️⃣  Get column headers from Sheet1..."
echo "   Command: excel-inspector $FILE | jq '.sheets.Sheet1.headers'"
excel-inspector $FILE | jq '.sheets.Sheet1.headers'
echo ""

# Example 4: Filter rows by condition
echo "4️⃣  Filter products with price > 20..."
echo "   Command: excel-inspector $FILE | jq '.sheets.Products.data[] | select(.Price > 20)'"
# Uncomment if you have Products sheet with Price column:
# excel-inspector $FILE | jq '.sheets.Products.data[] | select(.Price > 20)'
echo "   (Requires Products sheet with Price column)"
echo ""

# Example 5: Extract specific columns
echo "5️⃣  Extract only name and price columns..."
echo "   Command: excel-inspector $FILE | jq '.sheets.Products.data[] | {name: .Name, price: .Price}'"
# Uncomment if you have appropriate columns:
# excel-inspector $FILE | jq '.sheets.Products.data[] | {name: .Name, price: .Price}'
echo "   (Requires Products sheet with Name and Price columns)"
echo ""

# Example 6: Count non-empty values in a column
echo "6️⃣  Get column statistics..."
echo "   Command: excel-inspector $FILE | jq '.sheets.Sheet1.columnStats'"
excel-inspector $FILE | jq '.sheets.Sheet1.columnStats'
echo ""

echo "✅ Filtering examples completed!"
echo ""
echo "💡 Install jq: sudo apt install jq (Linux) or brew install jq (Mac)"
