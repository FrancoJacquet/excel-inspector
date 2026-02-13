# Changelog

All notable changes to Excel Inspector will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned
- CSV export option
- Support for older Excel formats (.xls)
- TypeScript definitions
- Performance optimizations for huge files
- Advanced column statistics (min/max/avg for numbers)
- Watch mode for auto-reload

---

## [1.0.0] - 2026-02-13

### 🎉 Initial Release

#### ✨ Added
- **Core CLI functionality** to convert Excel (.xlsx, .xlsm) to JSON
- **Sheet selection** via `--sheet "Name"` option
- **Headers-only mode** via `--headers-only` flag for quick structure preview
- **Row limiting** via `--limit N` option for large file handling
- **Raw output mode** via `--raw` flag for single-line JSON
- **Column statistics** including:
  - Type detection (string, number, boolean, etc.)
  - Non-empty vs empty counts
  - Sample values (first 3)
- **Metadata output** with:
  - Filename and filepath
  - Sheet names and count
  - Generation timestamp
  - Applied options
- **Shebang support** for direct CLI execution
- **Help command** via `--help`

#### 📚 Documentation
- Comprehensive README.md with:
  - Installation instructions (global & local)
  - Usage examples and common use cases
  - Badges and professional formatting
  - Links to npm, GitHub, and documentation
- AI-USAGE.md with protocol for AI assistants
- MIT License
- CONTRIBUTING.md with contribution guidelines
- CHANGELOG.md (this file)

#### 🛠️ Configuration
- package.json with full metadata:
  - Repository, homepage, bugs URLs
  - Comprehensive keywords for discoverability
  - Engine requirements (Node.js >= 14)
  - Files list for npm package
- .gitignore for development files
- .npmignore for clean package distribution

#### 📦 Dependencies
- xlsx ^0.18.5 for Excel parsing

---

## Version History Summary

- **1.0.0** - Initial public release with core functionality and comprehensive documentation

---

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) for how to contribute to this changelog.

---

## Links

- [GitHub Releases](https://github.com/yourusername/excel-inspector/releases)
- [NPM Package](https://www.npmjs.com/package/excel-inspector-cli)
- [Report Issues](https://github.com/yourusername/excel-inspector/issues)
