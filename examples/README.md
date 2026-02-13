# 📁 Examples

This directory contains usage examples and sample scripts for Excel Inspector.

---

## 📋 Sample Excel Files

Excel files are **not included in this repository** due to file size constraints and licensing considerations.

### Creating Test Files

You can create your own test Excel files using:
- **Microsoft Excel**
- **Google Sheets** (export as .xlsx)
- **LibreOffice Calc**
- **Python** with `openpyxl` or `xlsxwriter`

### Suggested Test Files

Create these sample files for testing:

1. **simple.xlsx** - Basic data
   - Sheet: "Products"
   - Columns: Product Name, Price, Stock
   - 10-20 rows

2. **multi-sheet.xlsx** - Multiple sheets
   - Sheet 1: "Sales"
   - Sheet 2: "Inventory"
   - Sheet 3: "Customers"

3. **large.xlsx** - Large dataset
   - 10,000+ rows
   - Test with `--limit` and `--headers-only`

4. **empty.xlsx** - Edge cases
   - Some empty sheets
   - Sheets with only headers

5. **mixed-types.xlsx** - Data type testing
   - Columns with strings, numbers, dates, booleans
   - Null/empty cells

---

## 🚀 Usage Examples

### Basic Inspection

```bash
# Inspect entire workbook
excel-inspector simple.xlsx

# Save to file
excel-inspector simple.xlsx > output.json

# Pretty print with jq
excel-inspector simple.xlsx | jq '.'
```

### Working with Specific Sheets

```bash
# List all sheets first (headers only)
excel-inspector multi-sheet.xlsx --headers-only | jq '.metadata.sheets'

# Then extract specific sheet
excel-inspector multi-sheet.xlsx --sheet "Sales" > sales.json
```

### Large Files

```bash
# Check structure first
excel-inspector large.xlsx --headers-only

# Preview first 100 rows
excel-inspector large.xlsx --limit 100

# Get specific sheet with limit
excel-inspector large.xlsx --sheet "Data" --limit 50 > preview.json
```

### Data Analysis with jq

```bash
# Count rows in a sheet
excel-inspector data.xlsx | jq '.sheets.Sheet1.rowCount'

# Get column names
excel-inspector data.xlsx | jq '.sheets.Sheet1.headers'

# Filter rows
excel-inspector data.xlsx | jq '.sheets.Products.data[] | select(.Price > 100)'

# Extract specific columns
excel-inspector data.xlsx | jq '.sheets.Products.data[] | {name: .Product, price: .Price}'
```

---

## 📜 Sample Scripts

See the scripts in this directory:

- [**basic-usage.sh**](./basic-usage.sh) - Simple inspection examples
- [**data-pipeline.sh**](./data-pipeline.sh) - Processing multiple files
- [**filter-data.sh**](./filter-data.sh) - Filtering with jq
- [**node-example.js**](./node-example.js) - Programmatic usage in Node.js

---

## 🤖 AI Assistant Examples

### Example 1: User asks to analyze inventory

```bash
# Step 1: Get structure
excel-inspector inventory.xlsx --headers-only

# Step 2: AI reads sheets and presents summary
# "Found 3 sheets: Stock, Orders, Suppliers"

# Step 3: User asks for specific data
excel-inspector inventory.xlsx --sheet "Stock" --limit 50
```

### Example 2: User wants to migrate to database

```bash
# Step 1: Full analysis
excel-inspector database.xlsx

# Step 2: AI analyzes structure and proposes:
# - Table schemas
# - Column types
# - Relationships
```

---

## 💡 Tips

1. **Always start with `--headers-only`** for large files
2. **Use `--limit`** for quick previews
3. **Pipe to jq** for powerful filtering and transformation
4. **Save to file** when processing multiple times
5. **Use `--raw`** when piping to other tools

---

## 🔗 More Resources

- [Main README](../README.md)
- [AI Usage Guide](../AI-USAGE.md)
- [Contributing](../CONTRIBUTING.md)

---

**Need more examples?** Open an issue or contribute your own! 🙌
