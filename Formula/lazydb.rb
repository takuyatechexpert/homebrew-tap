class Lazydb < Formula
  desc "Standalone TUI SQL client with vim keybindings"
  homepage "https://github.com/takuyatechexpert/lazydb"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/takuyatechexpert/lazydb/releases/download/v0.2.2/lazydb-aarch64-apple-darwin.tar.gz"
      sha256 "5578f847a800cbdbd4fad1ef68c6b135ee66b0818fb489c5cfd9a7e2bf7ae973"
    end
    on_intel do
      url "https://github.com/takuyatechexpert/lazydb/releases/download/v0.2.2/lazydb-x86_64-apple-darwin.tar.gz"
      sha256 "457e1b33774a24d13fb5c98101581ff0f04db584050d988ab93de77d4207203b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/takuyatechexpert/lazydb/releases/download/v0.2.2/lazydb-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9e8b0d35738e3b078845e976e27341cc4f2fff7dd021eee4303e9798537baf06"
    end
    on_intel do
      url "https://github.com/takuyatechexpert/lazydb/releases/download/v0.2.3/lazydb-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "100368ea72d5c30a10b47e1cf5285fa6b454f545ea2d33483d3a46a8f75aff00"
    end
  end

  def install
    bin.install "lazydb"
  end

  test do
    assert_match "lazydb", shell_output("#{bin}/lazydb --version")
  end
end
