#!/bin/bash

# GitHub Actions Workflow Validation Script
# This script validates that the workflows are properly configured

echo "🔍 Validating GitHub Actions workflows..."

# Check if workflow files exist
if [ ! -f ".github/workflows/build.yml" ]; then
    echo "❌ Missing build workflow file"
    exit 1
fi

if [ ! -f ".github/workflows/release.yml" ]; then
    echo "❌ Missing release workflow file"
    exit 1
fi

echo "✅ Workflow files found"

# Check if the build works locally
echo "🔨 Testing local build..."
npm run build

if [ $? -eq 0 ]; then
    echo "✅ Local build successful"
else
    echo "❌ Local build failed"
    exit 1
fi

# Check if VSIX file was created
PACKAGE_NAME=$(node -p "require('./package.json').name")
PACKAGE_VERSION=$(node -p "require('./package.json').version")
VSIX_FILE="${PACKAGE_NAME}-${PACKAGE_VERSION}.vsix"

if [ -f "$VSIX_FILE" ]; then
    echo "✅ VSIX file created: $VSIX_FILE"
    echo "📦 File size: $(ls -lh $VSIX_FILE | awk '{print $5}')"
else
    echo "❌ VSIX file not found: $VSIX_FILE"
    exit 1
fi

# Validate workflow syntax (basic check)
echo "🔍 Checking workflow syntax..."

# Check for deprecated actions
if grep -q "actions/upload-artifact@v3" .github/workflows/*.yml; then
    echo "❌ Found deprecated actions/upload-artifact@v3"
    exit 1
fi

if grep -q "actions/upload-release-asset@v1" .github/workflows/*.yml; then
    echo "❌ Found deprecated actions/upload-release-asset@v1"
    exit 1
fi

echo "✅ No deprecated actions found"

# Check for required permissions
if ! grep -q "permissions:" .github/workflows/release.yml; then
    echo "❌ Missing permissions in release workflow"
    exit 1
fi

echo "✅ Permissions configured"

echo ""
echo "🎉 All validations passed!"
echo ""
echo "🚀 Automated Release Setup:"
echo "- Every push to master will automatically create a release"
echo "- The current version (1.0.0) will be used as the release tag"
echo "- Users can download the .vsix file from the releases page"
echo ""
echo "Next steps:"
echo "1. Commit and push the workflow files to master"
echo "2. The release will be created automatically!"
echo "3. Check the GitHub Actions tab for workflow execution"
echo "4. Users can download the VSIX from the releases page"
echo ""
echo "To create a new version:"
echo "1. Update version in package.json"
echo "2. Commit and push to master"
echo "3. New release will be created automatically!"
