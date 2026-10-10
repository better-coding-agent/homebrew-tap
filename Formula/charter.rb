# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class Charter < Formula
  desc "Command-line access to Charter workspaces (stable channel)"
  homepage "https://charter.build"
  version "0.27.1"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.27.1/charter-0.27.1-darwin-arm64.tar.gz"
      sha256 "41fcc7993f7fd59799e8c09c5bc389312fa662880668987b2d72ec75765de874"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.27.1/charter-0.27.1-darwin-arm64.tar.gz"
        sha256 "41fcc7993f7fd59799e8c09c5bc389312fa662880668987b2d72ec75765de874"
      else
        url "https://releases.charter.build/cli/nightly/0.27.1/charter-0.27.1-darwin-x64.tar.gz"
        sha256 "839617ec34520022e1fc058be4023ffd2c39471d7cf9b7d2c4cfdfa1491f31d2"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.27.1/charter-0.27.1-linux-arm64.tar.gz"
      sha256 "d438f30ec7cdd527bbcbe375e1c936e2a492af5dce1841143c7fbd7acfc8ebc6"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.27.1/charter-0.27.1-linux-x64.tar.gz"
      sha256 "a6fc2a143962364866b2209d769213e43c9d483e4c2c0ccda9ec4deea0d0078b"
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
