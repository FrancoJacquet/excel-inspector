# Publish Guide for Maintainers

This guide is for maintainers who want to publish new versions to npm.

## Prerequisites

1. You have publishing rights to the npm package
2. You're logged in to npm: `npm login`
3. Your working directory is clean (no uncommitted changes)

## Publishing Steps

### 1. Update Version

Choose the appropriate version bump:

```bash
# Patch version (bug fixes): 1.0.0 -> 1.0.1
npm version patch

# Minor version (new features): 1.0.0 -> 1.1.0
npm version minor

# Major version (breaking changes): 1.0.0 -> 2.0.0
npm version major
```

This will:
- Update `package.json` version
- Create a git commit
- Create a git tag

### 2. Update CHANGELOG.md

Edit [CHANGELOG.md](./CHANGELOG.md) to document changes:

```markdown
## [1.1.0] - 2026-02-XX

### Added
- New feature X
- New option Y

### Fixed
- Bug Z
```

Commit the changelog:
```bash
git add CHANGELOG.md
git commit -m "docs: update changelog for v1.1.0"
```

### 3. Push to GitHub

```bash
git push origin main --tags
```

### 4. Publish to npm

```bash
# Dry run first (see what would be published)
npm publish --dry-run

# Actually publish
npm publish
```

### 5. Create GitHub Release

1. Go to: https://github.com/FrancoJacquet/excel-inspector/releases/new
2. Select the tag you just created
3. Title: `v1.1.0`
4. Copy the relevant section from CHANGELOG.md
5. Click "Publish release"

## Pre-publish Checklist

- [ ] All tests pass
- [ ] Documentation is up to date
- [ ] CHANGELOG.md is updated
- [ ] Version number follows semver
- [ ] No sensitive files in package (check with `npm publish --dry-run`)
- [ ] README examples work with new version

## Troubleshooting

### "You do not have permission to publish"

Make sure you're logged in with the correct npm account:
```bash
npm whoami
npm login
```

### "Version already exists"

You can't republish a version. Bump the version and try again.

### "Some files may be exposed"

Check `.npmignore` to ensure sensitive files aren't included.

## Version Guidelines

Follow [Semantic Versioning](https://semver.org/):

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

## Questions?

Open an issue or contact the maintainers.
