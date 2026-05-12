class Lazydb < Formula
  desc "Standalone TUI SQL client with vim keybindings"
  homepage "https://github.com/takuyatechexpert/lazydb"
  version "0.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/takuyatechexpert/lazydb/releases/download/v0.2.4/lazydb-aarch64-apple-darwin.tar.gz"
      sha256 "d251718330ae9b4323f7e3096f9ab3291d881c2ac6393db01adc8ca39b06219b"
    end
    on_intel do
      url "https://github.com/takuyatechexpert/lazydb/releases/download/v0.2.4/lazydb-x86_64-apple-darwin.tar.gz"
      sha256 "c4e1d0f05a24a79067ab28335743e28128d7ee404a6705a62eb7bf2806545f0b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/takuyatechexpert/lazydb/releases/download/v0.2.4/lazydb-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "55698abaa9c6365e44ad26119ae681eac02c105705f59e88bd7bf64f6ca9ef2f"
    end
    on_intel do
      url "https://github.com/takuyatechexpert/lazydb/releases/download/v0.2.4/lazydb-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "154a7f47ead97b2dfb5fbc39261d9caeb1aa219129bbbcb2ee32b5b10a2c64a0"
    end
  end

  def install
    bin.install "lazydb"
  end

  test do
    assert_match "lazydb", shell_output("#{bin}/lazydb --version")
  end
end
