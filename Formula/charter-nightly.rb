# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class CharterNightly < Formula
  desc "Command-line access to Charter workspaces (nightly channel)"
  homepage "https://charter.build"
  version "0.21.1"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.21.1/charter-0.21.1-darwin-arm64.tar.gz"
      sha256 "5d663a56f71f16ea5645641be6ee7cec017abc32b8d0b39f5e10adbad6ee4ba2"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.21.1/charter-0.21.1-darwin-arm64.tar.gz"
        sha256 "5d663a56f71f16ea5645641be6ee7cec017abc32b8d0b39f5e10adbad6ee4ba2"
      else
        url "https://releases.charter.build/cli/nightly/0.21.1/charter-0.21.1-darwin-x64.tar.gz"
        sha256 "bd8c30d6b996c40d62e82a09029f1651f318681b3a686e9207a535a86f853f3b"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.21.1/charter-0.21.1-linux-arm64.tar.gz"
      sha256 "f6122c1cbd760a10b9a39db6cd7227c05eda52264607a3c1b337429f707c84a3"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.21.1/charter-0.21.1-linux-x64.tar.gz"
      sha256 "1940658fcdf4180e3338b7c550bb4be90e7487d47650899c008ac83150047e05"
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
