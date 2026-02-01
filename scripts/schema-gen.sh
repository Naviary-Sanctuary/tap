#!/usr/bin/env bash
set -e

VERSION=$1

if [ -z "$VERSION" ]; then
  echo "Usage: $0 <version>"
  echo "Example: $0 v0.1.0"
  exit 1
fi

VERSION_NUMBER="${VERSION#v}"

echo "⏳ Calculating SHA256 for version: $VERSION"
echo ""

# macOS ARM64
echo "📦 Downloading macOS ARM64..."
SHA_MACOS=$(curl -sL "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/$VERSION/schema-gen-macos-arm64" | shasum -a 256 | cut -d' ' -f1)

# Linux x64
echo "📦 Downloading Linux x64..."
SHA_LINUX=$(curl -sL "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/$VERSION/schema-gen-linux-x64" | shasum -a 256 | cut -d' ' -f1)

echo ""
echo "✅ Done!"
echo ""
echo "Copy this to Formula/schema-gen.rb:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
cat <<EOF
  version "$VERSION_NUMBER"

  on_macos do
    url "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/$VERSION/schema-gen-macos-arm64"
    sha256 "$SHA_MACOS"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/$VERSION/schema-gen-linux-x64"
      sha256 "$SHA_LINUX"
    end
  end
EOF
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"