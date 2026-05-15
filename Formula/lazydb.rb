class Lazydb < Formula
  desc "A standalone TUI SQL client"
  homepage "https://github.com/takuyatechexpert/lazydb"
  version "0.2.6"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/takuyatechexpert/lazydb/releases/download/v0.2.6/lazydb-aarch64-apple-darwin.tar.xz"
      sha256 "a14b87506b2411ad75aa77cfd1c1bcc29ae7f0bab94b9ef527a299d4752de0eb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/takuyatechexpert/lazydb/releases/download/v0.2.6/lazydb-x86_64-apple-darwin.tar.xz"
      sha256 "234ec4a140ad9e0926663455ce9e16ebe1ec5a3127d47b0d8f18fa9d316c7a8c"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/takuyatechexpert/lazydb/releases/download/v0.2.6/lazydb-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "56dcd4e91284f3f19f44f00511ccbd0f64dc6b538a4126bfacb2b21414005a2b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/takuyatechexpert/lazydb/releases/download/v0.2.6/lazydb-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c35154e417b13e12091d2f30d2254d433dfdefcffbe3035a3aa8595e567b48be"
    end
  end
  license "MIT"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-unknown-linux-gnu":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "lazydb" if OS.mac? && Hardware::CPU.arm?
    bin.install "lazydb" if OS.mac? && Hardware::CPU.intel?
    bin.install "lazydb" if OS.linux? && Hardware::CPU.arm?
    bin.install "lazydb" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
