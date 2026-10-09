# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class Charter < Formula
  desc "Command-line access to Charter workspaces (stable channel)"
  homepage "https://charter.build"
  version "0.23.1"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.23.1/charter-0.23.1-darwin-arm64.tar.gz"
      sha256 "68e79f218e44fc7f66fe1572001630608cfc357722aa9d0014405266990e6846"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.23.1/charter-0.23.1-darwin-arm64.tar.gz"
        sha256 "68e79f218e44fc7f66fe1572001630608cfc357722aa9d0014405266990e6846"
      else
        url "https://releases.charter.build/cli/nightly/0.23.1/charter-0.23.1-darwin-x64.tar.gz"
        sha256 "633f8439562ff8b90db6e401dfaf64f3b0e5d3510705750950ed3fe89ddc0e3b"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.23.1/charter-0.23.1-linux-arm64.tar.gz"
      sha256 "ebcf1ac27c065bb0ba92be8050efe3d491effb23465c9f0682c5f45edea47283"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.23.1/charter-0.23.1-linux-x64.tar.gz"
      sha256 "43410f147ddb41d6b8abeb4c84846e9fcc057e1aff708e81ea90f14845925ec7"
    end
  end

  conflicts_with "charter-build/tap/charter-nightly", because: "every channel installs the charter command"

  def install
    bin.install "charter"
    (libexec/"channel").write "stable\n"
  end

  test do
    system bin/"charter", "--version"
  end
end
