# 📊 Excel Inspector

> A powerful CLI tool to convert Excel files (.xlsx, .xlsm) to structured JSON - Built with AI workflows in mind

[![npm version](https://img.shields.io/npm/v/excel-inspector-cli.svg)](https://www.npmjs.com/package/excel-inspector-cli)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Node.js Version](https://img.shields.io/node/v/excel-inspector-cli.svg)](https://nodejs.org)

---

## ✨ Features

- 🚀 **Fast**: Convert Excel to JSON in seconds
- 🤖 **AI-First**: Perfect output format for LLM consumption
- 📊 **Smart Analysis**: Auto-detects column types and provides statistics
- 🎯 **Flexible**: Process entire workbooks or specific sheets
- 💻 **CLI & Programmatic**: Use as command or import as module
- 🔍 **Preview Mode**: Check structure without loading all data

---

## 📦 Installation

### Global (recommended for CLI usage)

```bash
npm install -g excel-inspector-cli
```

### Local (for use in projects)

```bash
npm install excel-inspector-cli
```

> 💡 **New to Excel Inspector?** Check out the [Quick Start Guide](./QUICKSTART.md) for a 60-second tour!

---

## 🚀 Quick Start

### Basic Usage

```bash
# Inspect entire workbook
excel-inspector myfile.xlsx

# Inspect specific sheet
excel-inspector myfile.xlsx --sheet "Sales Data"

# Preview structure only (no data)
excel-inspector myfile.xlsx --headers-only

# Limit rows (useful for large files)
excel-inspector myfile.xlsx --limit 100
```

### Output

The tool outputs structured JSON to stdout:

```json
{
  "metadata": {
    "filename": "myfile.xlsx",
    "sheets": ["Sheet1", "Sheet2"],
    "sheetCount": 2,
    "generatedAt": "2026-02-13T10:30:00.000Z"
  },
  "sheets": {
    "Sheet1": {
      "headers": ["Product", "Price", "Stock"],
      "rowCount": 150,
      "columnStats": {
        "Product": {
          "nonEmptyCount": 150,
          "types": ["string"],
          "sampleValues": ["Widget A", "Widget B", "Widget C"]
        },
        "Price": {
          "nonEmptyCount": 148,
          "types": ["number"],
          "sampleValues": [19.99, 29.99, 9.99]
        }
      },
      "data": [
        { "Product": "Widget A", "Price": 19.99, "Stock": 50 },
        { "Product": "Widget B", "Price": 29.99, "Stock": 30 }
      ]
    }
  }
}
```

---

## 📖 Usage Guide

### Command Line Options

| Option | Description | Example |
|--------|-------------|---------|
| `--sheet "Name"` | Process only specific sheet | `--sheet "Sales"` |
| `--headers-only` | Return structure only (no data) | `--headers-only` |
| `--limit N` | Limit to N rows per sheet | `--limit 50` |
| `--raw` | Output JSON in single line | `--raw` |
| `--help` | Show help | `--help` |

### Common Use Cases

#### 1. Quick Preview of Large Files

```bash
excel-inspector huge-file.xlsx --headers-only
```

Returns only sheet names and column headers, perfect for understanding structure without loading GBs of data.

#### 2. Extract Single Sheet

```bash
excel-inspector report.xlsx --sheet "Q4 Summary" > q4-data.json
```

#### 3. Sample Data for Testing

```bash
excel-inspector database.xlsx --limit 10 > sample.json
```

#### 4. Pipe to jq for Filtering

```bash
excel-inspector data.xlsx | jq '.sheets.Sheet1.data[] | select(.Price > 20)'
```

#### 5. Use in Scripts

```bash
#!/bin/bash
DATA=$(excel-inspector inventory.xlsx --sheet "Stock" --raw)
echo $DATA | jq '.sheets.Stock.rowCount'
```

---

## 💻 Programmatic Usage (Node.js)

```javascript
const inspectExcel = require('excel-inspector-cli');

// Inspect file
const result = await inspectExcel('data.xlsx', {
  sheet: 'Sales',          // Optional: specific sheet
  headersOnly: false,      // Optional: structure only
  limit: 100               // Optional: row limit
});

console.log(result.sheets.Sales.data);
```

---

## 🤖 For AI/LLM Usage

This tool was specifically designed for AI workflows. See [AI-USAGE.md](./AI-USAGE.md) for detailed instructions on how AIs should use this tool when users request Excel analysis.

**Quick Protocol for AIs:**

1. Run inspector with `--headers-only` first
2. Present structured summary to user
3. Offer options: view data, analyze structure, export, etc.
4. Load full data only if needed

---

## 🛠️ Development

```bash
# Clone repository
git clone https://github.com/FrancoJacquet/excel-inspector.git
cd excel-inspector

# Install dependencies
npm install

# Run locally
node index.js test-file.xlsx

# Run tests (if available)
npm test
```

---

## 🤝 Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines.

**Ideas for contributions:**
- Add CSV export option
- Support for older Excel formats (.xls)
- Add TypeScript definitions
- Performance optimizations for huge files
- More column statistics (min/max/avg for numbers)

---

## 📝 Changelog

See [CHANGELOG.md](./CHANGELOG.md) for version history.

---

## 📄 License

MIT © [Excel Inspector Contributors](./LICENSE)

---

## 🙏 Acknowledgments

Built with:
- [SheetJS](https://github.com/SheetJS/sheetjs) - Excel parsing engine
- Designed for seamless integration with AI assistants (Claude, ChatGPT, etc.)

---

## 💡 Why Excel Inspector?

Most Excel parsing tools either:
- Return data in formats difficult for AIs to consume
- Lack contextual metadata (column types, row counts, etc.)
- Don't handle large files efficiently
- Require complex APIs

**Excel Inspector** solves this by providing a **simple CLI with rich, structured JSON output** that both humans and AIs can easily understand and process.

---

## 🔗 Links

- [NPM Package](https://www.npmjs.com/package/excel-inspector-cli)
- [GitHub Repository](https://github.com/FrancoJacquet/excel-inspector)
- [Report Issues](https://github.com/FrancoJacquet/excel-inspector/issues)
- [Quick Start Guide](./QUICKSTART.md) - Get started in 60 seconds!
- [AI Usage Guide](./AI-USAGE.md) - For AI assistants
- [Contributing Guide](./CONTRIBUTING.md) - How to contribute
- [Changelog](./CHANGELOG.md) - Version history
- [Examples](./examples/) - Sample scripts and usage

---

**Made with ❤️ for developers and AI assistants**
