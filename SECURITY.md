# Security Policy

## Supported Versions

We release patches for security vulnerabilities in the following versions:

| Version | Supported          |
| ------- | ------------------ |
| 1.x.x   | :white_check_mark: |

## Reporting a Vulnerability

If you discover a security vulnerability in Excel Inspector, please report it privately:

### How to Report

1. **Do NOT open a public issue**
2. Email the maintainers directly at: [your-email@example.com]
3. Or use GitHub's private vulnerability reporting: https://github.com/yourusername/excel-inspector/security/advisories/new

### What to Include

- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if you have one)

### What to Expect

- We will acknowledge receipt within 48 hours
- We will investigate and provide updates within 7 days
- We will work with you to understand and fix the issue
- We will credit you in the security advisory (unless you prefer to remain anonymous)

## Security Best Practices

When using Excel Inspector:

1. **Validate input files**: Don't process Excel files from untrusted sources without validation
2. **Limit file size**: Use `--limit` option for large files to prevent memory issues
3. **Sanitize output**: If displaying output to users, sanitize any user-generated content
4. **Keep dependencies updated**: Run `npm update` regularly

## Known Limitations

- Excel Inspector parses Excel files using the `xlsx` library. Any vulnerabilities in that library may affect this tool.
- Very large Excel files (>100MB) may cause memory issues
- Malformed Excel files may cause unexpected behavior

## Disclosure Policy

When a security issue is fixed:

1. We will release a patch version
2. We will publish a security advisory on GitHub
3. We will update the CHANGELOG.md
4. We will notify npm if the package was affected

Thank you for helping keep Excel Inspector secure! 🔒
