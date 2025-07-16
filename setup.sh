#!/bin/bash

# Nebula Midnight Theme Setup Script
# This script will build and install the theme

echo "🌌 Nebula Midnight Theme Setup"
echo "================================"

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ npm is not installed. Please install npm first."
    exit 1
fi

# Check if VS Code is installed
if ! command -v code &> /dev/null; then
    echo "❌ VS Code is not installed or not in PATH."
    echo "Please install VS Code and ensure it's accessible from the command line."
    exit 1
fi

echo "✅ Prerequisites check passed!"
echo ""

# Install dependencies
echo "📦 Installing dependencies..."
npm install

if [ $? -ne 0 ]; then
    echo "❌ Failed to install dependencies"
    exit 1
fi

echo "✅ Dependencies installed!"
echo ""

# Build the theme
echo "🔨 Building the theme..."
npm run build

if [ $? -ne 0 ]; then
    echo "❌ Failed to build the theme"
    exit 1
fi

echo "✅ Theme built successfully!"
echo ""

# Install the theme
echo "🚀 Installing the theme in VS Code..."
if command -v code &> /dev/null; then
    code --install-extension nebula-midnight-theme-1.0.0.vsix
    
    if [ $? -ne 0 ]; then
        echo "❌ Failed to install the theme"
        exit 1
    fi
    
    echo "✅ Theme installed successfully!"
else
    echo "⚠️  VS Code command not found. Please install the .vsix file manually:"
    echo "   1. Open VS Code"
    echo "   2. Press Ctrl+Shift+P (or Cmd+Shift+P on Mac)"
    echo "   3. Type 'Extensions: Install from VSIX'"
    echo "   4. Select the file: nebula-midnight-theme-1.0.0.vsix"
fi
echo ""
echo "🎉 Setup complete!"
echo ""
echo "To activate the theme:"
echo "1. Open VS Code"
echo "2. Press Ctrl+Shift+P (or Cmd+Shift+P on Mac)"
echo "3. Type 'Preferences: Color Theme'"
echo "4. Select 'Nebula Midnight'"
echo ""
echo "Enjoy your new cosmic coding experience! 🌌"
