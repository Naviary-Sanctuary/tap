class SchemaGen < Formula
  desc "Automatically generate validation schemas from TypeScript class definitions"
  homepage "https://github.com/Naviary-Sanctuary/schema-gen"
  license "MIT"
  version "0.1.3"

  on_macos do
    url "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/v0.1.3/schema-gen-macos-arm64"
    sha256 "9436ae8a71b0de711a3839a6b448ccc73591995a9c5f08662e2cad5520b8c148"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/v0.1.3/schema-gen-linux-x64"
      sha256 "ea06fa795e61ac3c9eb0636feb6c6792ec5db016948b9728b151b2cb5f1ac467"
    end
  end

  def install
    if OS.mac?
      bin.install "schema-gen-macos-arm64" => "schema-gen"
    elsif OS.linux?
      bin.install "schema-gen-linux-x64" => "schema-gen"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/schema-gen --version")
  end
end