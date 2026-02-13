# 📝 TODO & Future Ideas

This document tracks potential improvements and features for Excel Inspector.

---

## 🔥 High Priority

- [ ] **Add tests** - Unit tests with Jest or Mocha
- [ ] **TypeScript definitions** - Add `.d.ts` files for better IDE support
- [ ] **CSV export option** - Add `--csv` flag to export sheets as CSV
- [ ] **Better error messages** - More descriptive errors with suggestions
- [ ] **Progress indicator** - Show progress for large files

---

## 🎯 Medium Priority

- [ ] **Support .xls format** - Older Excel format support
- [ ] **Streaming for huge files** - Process files line-by-line to reduce memory
- [ ] **Column type inference improvements** - Better detection of dates, currencies, etc.
- [ ] **Empty cell handling** - Option to exclude or include empty cells
- [ ] **Formula evaluation** - Optionally evaluate formulas instead of showing text
- [ ] **Multiple file processing** - Process multiple files in one command
- [ ] **Watch mode** - Auto-reload when file changes
- [ ] **Output format options** - YAML, TOML, etc.

---

## 💡 Nice to Have

- [ ] **Web interface** - Simple web UI for drag-and-drop
- [ ] **REST API** - Microservice for Excel parsing
- [ ] **Docker image** - Containerized version
- [ ] **Validation schemas** - Validate Excel structure against a schema
- [ ] **Data transformation** - Built-in jq-like filtering
- [ ] **Diff mode** - Compare two Excel files
- [ ] **Sheet merging** - Combine multiple sheets into one
- [ ] **Statistics mode** - Advanced column statistics (min, max, avg, std dev)
- [ ] **Chart data extraction** - Extract data from Excel charts
- [ ] **Conditional formatting detection** - Preserve formatting rules
- [ ] **Macro extraction** - List VBA macros in .xlsm files

---

## 🔧 Technical Improvements

- [ ] **Performance benchmarks** - Measure and optimize performance
- [ ] **Memory profiling** - Identify and fix memory leaks
- [ ] **Dependency updates** - Keep xlsx and other deps updated
- [ ] **Bundle size optimization** - Reduce package size
- [ ] **CLI framework** - Use commander.js or yargs for better arg parsing
- [ ] **Logging levels** - Add --verbose, --quiet flags
- [ ] **Config file support** - .excelrc for default options

---

## 📚 Documentation

- [ ] **Video tutorial** - Quick demo on YouTube
- [ ] **Interactive examples** - CodeSandbox or RunKit demos
- [ ] **Use case studies** - Real-world examples
- [ ] **API documentation** - Full API reference
- [ ] **Migration guide** - From other Excel tools
- [ ] **Troubleshooting guide** - Common issues and solutions

---

## 🤝 Community

- [ ] **Discord/Slack** - Community chat
- [ ] **Twitter account** - Share updates
- [ ] **Blog posts** - Tutorials and announcements
- [ ] **Awesome list** - Create awesome-excel-tools list

---

## 🎉 Fun Ideas

- [ ] **ASCII art mode** - Display small tables in terminal as ASCII art
- [ ] **Color output** - Colorize output for better readability
- [ ] **Emoji mode** - Use emojis for data types 😄
- [ ] **Meme sheets** - Detect and warn about Excel memes/jokes
- [ ] **Easter eggs** - Hidden features for fun

---

## 💭 Ideas Backlog

> Ideas from the community or maintainers that need more discussion:

- Support for Google Sheets (via API)
- Integration with databases (direct import)
- Excel generation (reverse operation)
- Template system for common structures
- AI-powered schema suggestion
- Natural language queries ("show me all rows where price > 100")

---

## ✅ Completed

Items that were on this list and are now done:

- [x] Initial CLI tool
- [x] Multiple sheet support
- [x] Headers-only mode
- [x] Row limiting
- [x] Comprehensive documentation
- [x] Example scripts
- [x] GitHub templates

---

## 📝 Contributing Ideas

Have an idea? 

1. Check if it's already listed here
2. Open an [issue](https://github.com/FrancoJacquet/excel-inspector/issues) to discuss
3. If approved, submit a PR!

See [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines.

---

**Last updated:** 2026-02-13
