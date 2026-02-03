class SchemaGen < Formula
  desc "Automatically generate validation schemas from TypeScript class definitions"
  homepage "https://github.com/Naviary-Sanctuary/schema-gen"
  license "MIT"
  version "0.2.0"

  on_macos do
    url "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/v0.2.0/schema-gen-macos-arm64"
    sha256 "d694cd56c3a3b494fe7e4e1154292ddbb64d4061ca20a13412ce4f72462996b1"
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/Naviary-Sanctuary/schema-gen/releases/download/v0.2.0/schema-gen-linux-x64"
      sha256 "77af19a241df8bd7f3328a604a497ac405c7f6cefe8a0fa6ecd6b184f1d291ae"
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