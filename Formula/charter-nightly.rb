# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class CharterNightly < Formula
  desc "Command-line access to Charter workspaces (nightly channel)"
  homepage "https://charter.build"
  version "0.26.1"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.26.1/charter-0.26.1-darwin-arm64.tar.gz"
      sha256 "6bb81842cd97d80cef536b8514702f51ffe362328796a8d199677a9597e50628"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.26.1/charter-0.26.1-darwin-arm64.tar.gz"
        sha256 "6bb81842cd97d80cef536b8514702f51ffe362328796a8d199677a9597e50628"
      else
        url "https://releases.charter.build/cli/nightly/0.26.1/charter-0.26.1-darwin-x64.tar.gz"
        sha256 "0b4abfa8e07cfa2a31a8cd7e0bf3941209a2189c52094f8947bf571bbb1305b3"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.26.1/charter-0.26.1-linux-arm64.tar.gz"
      sha256 "27aaea766340ef3d18b35683a6e7c7406fa36f637601f9f560e9b51cd5f05032"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.26.1/charter-0.26.1-linux-x64.tar.gz"
      sha256 "91d0733121d1dc3c189920e118aff353e719c19c199f5796d8aabac50af3a64a"
    end
  end

  conflicts_with "charter-build/tap/charter", because: "every channel installs the charter command"

  def install
    bin.install "charter"
    (libexec/"channel").write "nightly\n"
  end

  test do
    system bin/"charter", "--version"
  end
end
