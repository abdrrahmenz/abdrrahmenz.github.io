#!/bin/bash

# Build script for deploying Flutter web app to GitHub Pages

set -e

echo "🚀 Building Flutter web application..."

# Navigate to Flutter source directory
cd flutter_source

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# Analyze code
echo "🔍 Analyzing code..."
flutter analyze

# Run tests
echo "🧪 Running tests..."
flutter test

# Build for web
echo "🏗️ Building web application..."
flutter build web --release --base-href "/abdrrahmenz.github.io/"

# Go back to root directory
cd ..

echo "📁 Copying build files to repository root..."

# Backup important files
cp -r .git .git_backup
cp -r .github .github_backup

# Remove existing files (except protected ones)
find . -maxdepth 1 -not -name '.git*' -not -name 'flutter_source' -not -name '.github*' -not -name '.' -not -name 'build.sh' -exec rm -rf {} \; 2>/dev/null || true

# Restore protected directories
if [ -d ".git_backup" ]; then
    mv .git_backup .git
fi
if [ -d ".github_backup" ]; then
    mv .github_backup .github
fi

# Copy build output to root
cp -r flutter_source/build/web/* .

# Create .nojekyll file for GitHub Pages
touch .nojekyll

# Create CNAME file if needed (replace with your domain)
# echo "yourdomain.com" > CNAME

echo "✅ Build completed successfully!"
echo "📂 Files are ready for deployment to GitHub Pages"
echo ""
echo "Next steps:"
echo "1. Commit the changes: git add ."
echo "2. Commit: git commit -m 'Deploy Flutter web app'"
echo "3. Push: git push origin main"