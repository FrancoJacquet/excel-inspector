# Contributing to Excel Inspector

First off, thank you for considering contributing to Excel Inspector! 🎉

This document provides guidelines for contributing to the project. Following these guidelines helps maintain a high-quality codebase and makes it easier for everyone to collaborate.

---

## 📋 Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
- [Development Setup](#development-setup)
- [Coding Standards](#coding-standards)
- [Commit Messages](#commit-messages)
- [Pull Request Process](#pull-request-process)
- [Testing](#testing)

---

## 📜 Code of Conduct

This project follows a simple principle: **Be respectful and constructive**.

- Use welcoming and inclusive language
- Be respectful of differing viewpoints
- Accept constructive criticism gracefully
- Focus on what is best for the community

---

## 🤝 How Can I Contribute?

### Reporting Bugs

Before submitting a bug report:
- Check the [issue tracker](https://github.com/FrancoJacquet/excel-inspector/issues) to avoid duplicates
- Collect relevant information (Node version, Excel file format, command used, etc.)

**When submitting a bug report, include:**
- A clear, descriptive title
- Steps to reproduce the issue
- Expected vs actual behavior
- Your environment (OS, Node.js version)
- Sample Excel file (if possible)

### Suggesting Features

Feature requests are welcome! Please:
- Use the [issue tracker](https://github.com/FrancoJacquet/excel-inspector/issues)
- Provide a clear description of the feature
- Explain the use case and benefits
- Consider backward compatibility

### Code Contributions

We love pull requests! Here are some ideas for contributions:

**Easy (Good First Issues):**
- Add more examples
- Improve documentation
- Fix typos or formatting
- Add tests

**Medium:**
- Add new CLI options
- Improve error messages
- Optimize performance
- Add CSV export

**Advanced:**
- Support older Excel formats (.xls)
- Add TypeScript definitions
- Implement streaming for huge files
- Add more column statistics

---

## 🛠️ Development Setup

### Prerequisites

- Node.js >= 14.0.0
- npm or yarn

### Setup Steps

1. **Fork and clone the repository:**
   ```bash
   git clone https://github.com/YOUR_USERNAME/excel-inspector.git
   cd excel-inspector
   ```

2. **Install dependencies:**
   ```bash
   npm install
   ```

3. **Make your changes:**
   - Edit `index.js` or create new files
   - Test locally: `node index.js test-file.xlsx`

4. **Test with different options:**
   ```bash
   node index.js sample.xlsx --headers-only
   node index.js sample.xlsx --sheet "Sheet1" --limit 10
   node index.js sample.xlsx --raw
   ```

---

## 📐 Coding Standards

### JavaScript Style

- Use **ES6+** syntax where appropriate
- Prefer `const` over `let`, avoid `var`
- Use meaningful variable names
- Add comments for complex logic
- Keep functions small and focused

### Code Structure

```javascript
// Good
function parseSheet(worksheet, options) {
  const { limit, headersOnly } = options;
  // ... implementation
}

// Avoid
function doStuff(x, y, z) {
  // ... complex logic without comments
}
```

### Error Handling

Always handle errors gracefully:

```javascript
try {
  const workbook = XLSX.readFile(filePath);
} catch (error) {
  console.error(`Error reading file: ${error.message}`);
  process.exit(1);
}
```

---

## 💬 Commit Messages

Use clear, descriptive commit messages following this format:

```
<type>: <short description>

<optional detailed description>

<optional footer>
```

**Types:**
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation only
- `style`: Code formatting (no logic change)
- `refactor`: Code restructuring (no behavior change)
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

**Examples:**
```bash
feat: add CSV export option

Implement --csv flag to export sheets as CSV files instead of JSON.
Includes option to specify output directory.

fix: handle missing headers in empty sheets

Previously, empty sheets would crash the tool. Now they return
an empty array with isEmpty flag set to true.

docs: update README with new examples
```

---

## 🔄 Pull Request Process

1. **Create a feature branch:**
   ```bash
   git checkout -b feat/my-new-feature
   ```

2. **Make your changes and commit:**
   ```bash
   git add .
   git commit -m "feat: add amazing feature"
   ```

3. **Push to your fork:**
   ```bash
   git push origin feat/my-new-feature
   ```

4. **Create a Pull Request:**
   - Go to the original repository
   - Click "New Pull Request"
   - Select your branch
   - Fill in the PR template

5. **PR Requirements:**
   - Clear description of changes
   - Reference related issues (e.g., "Fixes #123")
   - All tests pass (if applicable)
   - Documentation updated (if needed)
   - No merge conflicts

6. **Review Process:**
   - Maintainers will review your PR
   - Address any requested changes
   - Once approved, it will be merged!

---

## 🧪 Testing

### Manual Testing

Before submitting a PR, test your changes with:

```bash
# Basic functionality
node index.js test-file.xlsx

# Different options
node index.js test-file.xlsx --headers-only
node index.js test-file.xlsx --sheet "MySheet"
node index.js test-file.xlsx --limit 5

# Edge cases
node index.js empty-file.xlsx
node index.js huge-file.xlsx --headers-only
```

### Test Files

Create test Excel files with:
- Empty sheets
- Single row (headers only)
- Mixed data types (strings, numbers, dates)
- Special characters in headers
- Large number of rows

### Automated Tests (Future)

We plan to add automated testing with Jest or Mocha. Contributions welcome!

---

## 📝 Documentation

When adding features, update:
- **README.md** - Usage examples and options
- **AI-USAGE.md** - If it affects AI consumption
- **CHANGELOG.md** - Document the change
- **Code comments** - Explain complex logic

---

## ❓ Questions?

If you have questions:
- Check existing [issues](https://github.com/FrancoJacquet/excel-inspector/issues)
- Open a new issue with the "question" label
- Join discussions (if available)

---

## 🙏 Thank You!

Your contributions make Excel Inspector better for everyone. We appreciate your time and effort! ❤️

---

**Happy coding!** 🚀
