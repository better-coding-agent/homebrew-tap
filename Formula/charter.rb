# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class Charter < Formula
  desc "Command-line access to Charter workspaces (stable channel)"
  homepage "https://charter.build"
  version "0.28.1"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.28.1/charter-0.28.1-darwin-arm64.tar.gz"
      sha256 "d84b0c8182a8843ada3b531a154a5024ede08e2c704ce7b102f1684d7bfb30e1"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.28.1/charter-0.28.1-darwin-arm64.tar.gz"
        sha256 "d84b0c8182a8843ada3b531a154a5024ede08e2c704ce7b102f1684d7bfb30e1"
      else
        url "https://releases.charter.build/cli/nightly/0.28.1/charter-0.28.1-darwin-x64.tar.gz"
        sha256 "cbb9856066d5cc47a72aaa0ebf8e72d75ccf1cc162a6e99b97423346316a479c"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.28.1/charter-0.28.1-linux-arm64.tar.gz"
      sha256 "519a7088997b99b3b554ad985b46f714c4781c009fdeeb4f422307848fc475bf"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.28.1/charter-0.28.1-linux-x64.tar.gz"
      sha256 "960d70b096ce7e9fd1014f373f803d310d9a1b85137afad91830fb2d29cb62bb"
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
