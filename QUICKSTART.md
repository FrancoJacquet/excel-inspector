# ⚡ Quick Start Guide

Get started with Excel Inspector in 60 seconds!

---

## 🚀 Installation

```bash
npm install -g excel-inspector-cli
```

---

## 🎯 Your First Command

```bash
# Inspect an Excel file
excel-inspector myfile.xlsx
```

**Output:** Structured JSON with all your Excel data.

---

## 💡 Common Tasks

### Preview Structure (without loading all data)

```bash
excel-inspector myfile.xlsx --headers-only
```

**Perfect for:** Understanding what's in a file before processing it.

### Extract Specific Sheet

```bash
excel-inspector myfile.xlsx --sheet "Sales Data"
```

**Perfect for:** Working with multi-sheet workbooks.

### Limit Rows (for large files)

```bash
excel-inspector myfile.xlsx --limit 100
```

**Perfect for:** Getting a quick preview of huge files.

### Save to File

```bash
excel-inspector myfile.xlsx > output.json
```

**Perfect for:** Keeping the data for later processing.

---

## 🎨 Make it Pretty

Install `jq` for beautiful formatting:

```bash
# Linux
sudo apt install jq

# macOS
brew install jq

# Windows
choco install jq
```

Then:

```bash
excel-inspector myfile.xlsx | jq '.'
```

---

## 🤖 For AI Assistants

If you're an AI helping a user, read [AI-USAGE.md](./AI-USAGE.md) for the complete protocol.

**Quick version:**
1. Run with `--headers-only` first
2. Present summary to user
3. Load full data only if needed

---

## 📚 Next Steps

- Read the [full README](./README.md) for all options
- Check out [examples/](./examples/) for more use cases
- Learn about [programmatic usage](./examples/node-example.js)

---

## ❓ Need Help?

- Run `excel-inspector --help` for inline help
- Check [GitHub Issues](https://github.com/yourusername/excel-inspector/issues)
- Read the [documentation](./README.md)

---

**Happy Excel parsing!** 🎉
