class Lazydb < Formula
  desc "Standalone TUI SQL client with vim keybindings"
  homepage "https://github.com/takuyatechexpert/lazydb"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/takuyatechexpert/lazydb/releases/download/v0.2.0/lazydb-aarch64-apple-darwin.tar.gz"
      sha256 "7d8c3c8ea8319d257a489053920f2c3f6e17aa060108455e5871e25ea8c12462"
    end
    on_intel do
      url "https://github.com/takuyatechexpert/lazydb/releases/download/v0.2.0/lazydb-x86_64-apple-darwin.tar.gz"
      sha256 "d7dcda8df9f45e56453c825bf861b5eb0182421c2edb48062538d73fc316d07e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/takuyatechexpert/lazydb/releases/download/v0.2.0/lazydb-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a7f853a8ac48a35e25f5d9f703d538c737c4968b02ec158d95a7266e5381fd81"
    end
    on_intel do
      url "https://github.com/takuyatechexpert/lazydb/releases/download/v0.2.0/lazydb-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1b1f7b25fb5af29b2a5fa0fe3768807ef074c214f30e933da19b6b1ae4041c5b"
    end
  end

  def install
    bin.install "lazydb"
  end

  test do
    assert_match "lazydb", shell_output("#{bin}/lazydb --version")
  end
end
