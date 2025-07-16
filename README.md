# Nebula Midnight Theme

A stunning dark theme for Visual Studio Code with purple accents inspired by cosmic nebulae. This theme provides a comfortable coding experience with carefully chosen colors that reduce eye strain while maintaining excellent readability.

## 🌟 Features

- **Dark theme optimized for long coding sessions**
- **Purple accent colors inspired by cosmic nebulae**
- **Excellent contrast for better readability**
- **Syntax highlighting for multiple languages**
- **Consistent color scheme across all VS Code UI elements**

## 🎨 Preview

![Nebula Midnight Theme Preview](https://raw.githubusercontent.com/abue-ammar/nebula-midnight-theme/refs/heads/master/assets/Screenshot%20From%202025-07-16%2014-19-07.png)

## 🚀 Installation

### From VS Code Marketplace

1. Open Visual Studio Code
2. Go to Extensions (Ctrl+Shift+X)
3. Search for "Nebula Midnight"
4. Click Install

### From VSIX file

1. Download the latest `.vsix` file from the [releases page](https://github.com/abue-ammar/nebula-midnight-theme/releases)
2. Open VS Code
3. Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
4. Type "Extensions: Install from VSIX"
5. Select the downloaded `.vsix` file

### Manual Installation

```bash
# Clone the repository
git clone https://github.com/abue-ammar/nebula-midnight-theme.git

# Navigate to the project directory
cd nebula-midnight-theme

# Install dependencies
npm install

# Package the theme
npm run build

# Install the theme
npm run install
```

## 🎯 Activation

1. Open VS Code
2. Press `Ctrl+Shift+P` (or `Cmd+Shift+P` on Mac)
3. Type "Preferences: Color Theme"
4. Select "Nebula Midnight" from the list

## 🛠️ Development

### Prerequisites

- Node.js (version 16 or higher)
- npm
- Visual Studio Code

### Building from Source

```bash
# Clone the repository
git clone https://github.com/abue-ammar/nebula-midnight-theme.git

# Navigate to the project directory
cd nebula-midnight-theme

# Install dependencies
npm install

# Package the theme
npm run build
```

### Available Scripts

- `npm run build` - Package the theme into a .vsix file
- `npm run install` - Install the packaged theme in VS Code
- `npm run publish` - Publish the theme to the VS Code Marketplace
- `npm run package` - Alternative command to package the theme

## 🚀 Releases

This project uses GitHub Actions for automated releases. Every time you push to the `master` branch, a new release is automatically created with the latest `.vsix` file.

Users can download the latest `.vsix` file from the [releases page](https://github.com/abue-ammar/nebula-midnight-theme/releases).

### How It Works

1. **Push to master** - Any push to the master branch triggers the build workflow
2. **Automatic build** - The extension is built using Node.js 22
3. **Automatic release** - A new GitHub release is created with the current version from `package.json`
4. **Download ready** - Users can immediately download the `.vsix` file

### Creating a New Version

1. Update the version in `package.json`:

   ```json
   {
     "version": "1.0.1"
   }
   ```

2. Update any version references in scripts and files

3. Commit and push to master:

   ```bash
   git add .
   git commit -m "Bump version to 1.0.1"
   git push origin master
   ```

4. The release will be created automatically!

### Manual Release (Alternative)

You can still create manual releases using:

#### Method 1: Using the release script

```bash
./release.sh
```

#### Method 2: Using Git tags

```bash
git tag v1.0.1
git push origin v1.0.1
```

The GitHub Action will automatically:

- Build the `.vsix` file
- Create a release (if using tag method)
- Upload the `.vsix` file to the release
- Generate installation instructions

### Automated Workflows

- **Build & Test**: Runs on every push and pull request to ensure the theme builds correctly
- **Release**: Triggered on new releases or version tags, automatically builds and uploads the `.vsix` file

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. Here's how you can contribute:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Make your changes
4. Commit your changes (`git commit -m 'Add some amazing feature'`)
5. Push to the branch (`git push origin feature/amazing-feature`)
6. Open a Pull Request

## 📝 Customization

If you want to customize the theme colors, you can:

1. Fork this repository
2. Edit the `themes/nebula-midnight.json` file
3. Modify the color values to your preference
4. Build and install your custom version

## 🐛 Issues

If you encounter any problems or have suggestions, please [open an issue](https://github.com/abue-ammar/nebula-midnight-theme/issues).

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by the beauty of cosmic nebulae
- Built with love for the VS Code community
- Special thanks to all contributors

## 📊 Color Palette

| Color                | Hex       | Usage                                 |
| -------------------- | --------- | ------------------------------------- |
| Primary Purple       | `#b080ff` | Accent color, activity bar foreground |
| Deep Purple          | `#7138cc` | Buttons, badges                       |
| Dark Background      | `#19161d` | Main background                       |
| Secondary Background | `#28242e` | Activity bar, dropdown background     |
| Light Blue           | `#8dc8fb` | Debug icons, badges                   |
| Green                | `#80ffb5` | Success states, debug start           |
| Red                  | `#ff8080` | Error states, debug stop              |

---

Made with ❤️ by [Ammar](https://github.com/abue-ammar)
