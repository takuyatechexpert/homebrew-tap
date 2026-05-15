class Lazydb < Formula
  desc "Standalone TUI SQL client with vim keybindings"
  homepage "https://github.com/takuyatechexpert/lazydb"
  version "0.2.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/takuyatechexpert/lazydb/releases/download/v0.2.5/lazydb-aarch64-apple-darwin.tar.gz"
      sha256 "0e94f18fc9ecde4a01b3c5a8b3d3f50ddf3c9bf5578557c5bb0669d8fd635315"
    end
    on_intel do
      url "https://github.com/takuyatechexpert/lazydb/releases/download/v0.2.5/lazydb-x86_64-apple-darwin.tar.gz"
      sha256 "d39b840a14fdc3b7d134b6a268cbdfd3851f9a185e6448e0df66fda27c5bcf36"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/takuyatechexpert/lazydb/releases/download/v0.2.5/lazydb-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c1e82800dde5907d9347f6a7b06a7d650a1b84d70ebb2a746ac92bf2d501a147"
    end
    on_intel do
      url "https://github.com/takuyatechexpert/lazydb/releases/download/v0.2.5/lazydb-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f56db10512a26ea741b09f0d32e800db75adb8d747f5d06debb4862fe698e12b"
    end
  end

  def install
    bin.install "lazydb"
  end

  test do
    assert_match "lazydb", shell_output("#{bin}/lazydb --version")
  end
end
