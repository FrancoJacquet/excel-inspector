#!/bin/bash

# 🚀 Prepare Excel Inspector for Publishing
# =========================================
# This script helps you customize the project before publishing

set -e  # Exit on error

echo "🚀 Excel Inspector - Publish Preparation"
echo "========================================"
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if we're in the right directory
if [ ! -f "index.js" ] || [ ! -f "package.json" ]; then
  echo -e "${RED}❌ Error: This script must be run from the excel-inspector directory${NC}"
  exit 1
fi

echo "1️⃣  Gathering information..."
echo ""

# Get GitHub username
read -p "📝 Enter your GitHub username: " GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
  echo -e "${RED}❌ GitHub username is required${NC}"
  exit 1
fi

# Get email for security contact
read -p "📧 Enter your email for security reports: " SECURITY_EMAIL

if [ -z "$SECURITY_EMAIL" ]; then
  echo -e "${YELLOW}⚠️  Warning: No email provided. Using placeholder.${NC}"
  SECURITY_EMAIL="your-email@example.com"
fi

# Get package name (optional)
read -p "📦 Package name (press Enter to keep 'excel-inspector-cli'): " PKG_NAME
if [ -z "$PKG_NAME" ]; then
  PKG_NAME="excel-inspector-cli"
fi

echo ""
echo "2️⃣  Updating files..."
echo ""

# Create backup directory
BACKUP_DIR=".publish-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"
echo "📁 Created backup directory: $BACKUP_DIR"

# Backup original files
cp package.json "$BACKUP_DIR/"
cp SECURITY.md "$BACKUP_DIR/"
echo "✓ Backed up original files"

# Update package.json - GitHub username
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS
  sed -i '' "s|yourusername|$GITHUB_USERNAME|g" package.json
  sed -i '' "s|excel-inspector-cli|$PKG_NAME|g" package.json
else
  # Linux
  sed -i "s|yourusername|$GITHUB_USERNAME|g" package.json
  sed -i "s|excel-inspector-cli|$PKG_NAME|g" package.json
fi
echo "✓ Updated package.json"

# Update SECURITY.md - Email
if [[ "$OSTYPE" == "darwin"* ]]; then
  sed -i '' "s|your-email@example.com|$SECURITY_EMAIL|g" SECURITY.md
  sed -i '' "s|yourusername|$GITHUB_USERNAME|g" SECURITY.md
else
  sed -i "s|your-email@example.com|$SECURITY_EMAIL|g" SECURITY.md
  sed -i "s|yourusername|$GITHUB_USERNAME|g" SECURITY.md
fi
echo "✓ Updated SECURITY.md"

# Update all markdown files with GitHub username
for file in *.md; do
  if [ -f "$file" ]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
      sed -i '' "s|yourusername|$GITHUB_USERNAME|g" "$file"
    else
      sed -i "s|yourusername|$GITHUB_USERNAME|g" "$file"
    fi
  fi
done
echo "✓ Updated all markdown files"

echo ""
echo "3️⃣  Verification..."
echo ""

# Check if node_modules exists
if [ ! -d "node_modules" ]; then
  echo -e "${YELLOW}⚠️  node_modules not found. Running npm install...${NC}"
  npm install
fi

# Test CLI
echo "Testing CLI..."
if node index.js --help > /dev/null 2>&1; then
  echo -e "${GREEN}✓ CLI works!${NC}"
else
  echo -e "${RED}❌ CLI test failed${NC}"
  exit 1
fi

# Test package (dry run)
echo "Testing npm package..."
if npm publish --dry-run > /dev/null 2>&1; then
  echo -e "${GREEN}✓ Package is ready for npm!${NC}"
else
  echo -e "${YELLOW}⚠️  npm publish dry-run had warnings (check output)${NC}"
fi

echo ""
echo "4️⃣  Next Steps"
echo "============="
echo ""
echo "✓ Configuration updated!"
echo ""
echo "📝 Manual tasks remaining:"
echo ""
echo "1. Review and commit changes:"
echo "   ${GREEN}git add .${NC}"
echo "   ${GREEN}git commit -m 'feat: prepare for initial release'${NC}"
echo ""
echo "2. Create GitHub repository:"
echo "   - Go to: https://github.com/new"
echo "   - Repository name: excel-inspector"
echo "   - Make it public"
echo "   - Don't initialize with README (we have one)"
echo ""
echo "3. Push to GitHub:"
echo "   ${GREEN}git remote add origin https://github.com/$GITHUB_USERNAME/excel-inspector.git${NC}"
echo "   ${GREEN}git branch -M main${NC}"
echo "   ${GREEN}git push -u origin main${NC}"
echo ""
echo "4. Publish to npm:"
echo "   ${GREEN}npm login${NC}"
echo "   ${GREEN}npm publish${NC}"
echo ""
echo "5. Add GitHub topics:"
echo "   excel, xlsx, json, cli, parser, ai, llm, converter"
echo ""
echo "6. Share your project! 🎉"
echo ""
echo "📚 For more details, see: ${GREEN}RELEASE_READY.md${NC}"
echo ""
echo "🔙 Backup saved in: $BACKUP_DIR"
echo ""
