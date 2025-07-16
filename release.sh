#!/bin/bash

# Version Release Script for Nebula Midnight Theme
# This script helps create new releases with proper version management

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🌌 Nebula Midnight Theme Release Script${NC}"
echo "====================================="

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo -e "${RED}❌ This script must be run from the root of the git repository${NC}"
    exit 1
fi

# Check if working directory is clean
if [ -n "$(git status --porcelain)" ]; then
    echo -e "${RED}❌ Working directory is not clean. Please commit or stash changes first.${NC}"
    exit 1
fi

# Get current version
CURRENT_VERSION=$(node -p "require('./package.json').version")
echo -e "${BLUE}Current version: ${CURRENT_VERSION}${NC}"

# Ask for version type
echo -e "${YELLOW}What type of version bump do you want?${NC}"
echo "1) patch (${CURRENT_VERSION} -> $(npm version patch --dry-run | sed 's/v//'))"
echo "2) minor (${CURRENT_VERSION} -> $(npm version minor --dry-run | sed 's/v//'))"
echo "3) major (${CURRENT_VERSION} -> $(npm version major --dry-run | sed 's/v//'))"
echo "4) custom"
echo "5) cancel"

read -p "Enter your choice (1-5): " choice

case $choice in
    1)
        VERSION_TYPE="patch"
        ;;
    2)
        VERSION_TYPE="minor"
        ;;
    3)
        VERSION_TYPE="major"
        ;;
    4)
        read -p "Enter custom version (e.g., 1.2.3): " CUSTOM_VERSION
        if [[ ! $CUSTOM_VERSION =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
            echo -e "${RED}❌ Invalid version format. Please use semantic versioning (e.g., 1.2.3)${NC}"
            exit 1
        fi
        VERSION_TYPE="--new-version $CUSTOM_VERSION"
        ;;
    5)
        echo -e "${YELLOW}Release cancelled${NC}"
        exit 0
        ;;
    *)
        echo -e "${RED}❌ Invalid choice${NC}"
        exit 1
        ;;
esac

# Bump version
echo -e "${BLUE}🔄 Bumping version...${NC}"
if [ "$choice" == "4" ]; then
    npm version $CUSTOM_VERSION
    NEW_VERSION=$CUSTOM_VERSION
else
    NEW_VERSION=$(npm version $VERSION_TYPE | sed 's/v//')
fi

echo -e "${GREEN}✅ Version bumped to ${NEW_VERSION}${NC}"

# Build the extension
echo -e "${BLUE}🔨 Building extension...${NC}"
npm run build

# Check if build was successful
if [ ! -f "nebula-midnight-theme-${NEW_VERSION}.vsix" ]; then
    echo -e "${RED}❌ Build failed - .vsix file not found${NC}"
    exit 1
fi

echo -e "${GREEN}✅ Extension built successfully${NC}"

# Ask for confirmation to push
echo -e "${YELLOW}Ready to push version v${NEW_VERSION} to GitHub?${NC}"
read -p "This will trigger the release workflow. Continue? (y/N): " confirm

if [[ $confirm =~ ^[Yy]$ ]]; then
    echo -e "${BLUE}🚀 Pushing to GitHub...${NC}"
    git push origin master
    git push origin "v${NEW_VERSION}"
    
    echo -e "${GREEN}✅ Release pushed successfully!${NC}"
    echo -e "${BLUE}🎉 GitHub Actions will now build and create the release automatically${NC}"
    echo -e "${BLUE}📦 Users can download the .vsix file from: https://github.com/abue-ammar/nebula-midnight-theme/releases${NC}"
else
    echo -e "${YELLOW}Release cancelled. You can manually push later with:${NC}"
    echo "git push origin master"
    echo "git push origin v${NEW_VERSION}"
fi
