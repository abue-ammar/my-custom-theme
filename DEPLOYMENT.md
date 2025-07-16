# Deployment Guide

This guide explains how to use the automated release system for the Nebula Midnight Theme.

## Quick Start

The easiest way to create a new release is using the included script:

```bash
./release.sh
```

This script will:

1. Check your working directory is clean
2. Show current version and bump options
3. Update the version in `package.json`
4. Build the extension
5. Push the new version tag to GitHub
6. Trigger the automated release workflow

## Manual Release Process

### 1. Update Version

Edit `package.json` and update the version field:

```json
{
  "version": "0.0.6"
}
```

### 2. Build the Extension

```bash
npm run build
```

### 3. Create and Push Tag

```bash
git add package.json
git commit -m "Bump version to 0.0.6"
git tag v0.0.6
git push origin master
git push origin v0.0.6
```

### 4. Automatic Release

The GitHub Action will automatically:

- Build the `.vsix` file
- Create a GitHub release
- Upload the `.vsix` file as a release asset
- Generate installation instructions

## GitHub Actions Workflows

### Build Workflow (`.github/workflows/build.yml`)

- Runs on every push and pull request
- Ensures the theme builds correctly
- Uploads build artifacts

### Release Workflow (`.github/workflows/release.yml`)

- Triggered by new releases or version tags
- Builds the extension
- Creates/updates GitHub releases
- Uploads `.vsix` files

## User Download Experience

Users can download the latest version from:
https://github.com/abue-ammar/nebula-midnight-theme/releases

The release page will show:

- Installation instructions
- Direct download link for the `.vsix` file
- Command line installation command

## Troubleshooting

### Build Fails

- Check that all dependencies are installed: `npm ci`
- Ensure the theme JSON is valid
- Check GitHub Actions logs for detailed errors

### Release Not Created

- Ensure the tag follows the pattern `v*` (e.g., `v0.0.6`)
- Check that the repository has proper permissions
- Verify the GitHub token has release permissions

### VSIX File Missing

- Check that the `npm run build` command works locally
- Verify the `vsce` package is installed as a dev dependency
- Check the package.json scripts section
