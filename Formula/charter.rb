# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class Charter < Formula
  desc "Command-line access to Charter workspaces (stable channel)"
  homepage "https://charter.build"
  version "0.24.1"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.24.1/charter-0.24.1-darwin-arm64.tar.gz"
      sha256 "96a14c476c33e17172c84d70d310bbe51dfa0c4554d55b5c728c4adfcba31fec"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.24.1/charter-0.24.1-darwin-arm64.tar.gz"
        sha256 "96a14c476c33e17172c84d70d310bbe51dfa0c4554d55b5c728c4adfcba31fec"
      else
        url "https://releases.charter.build/cli/nightly/0.24.1/charter-0.24.1-darwin-x64.tar.gz"
        sha256 "1014a476e72edbfc9f29d050699ad3545d5f4ea4fdb80510008e3c422b856666"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.24.1/charter-0.24.1-linux-arm64.tar.gz"
      sha256 "1f5fc46cd78ebf44d3d9974dc663d6cf7765b95f31139ad0f79cf14f6d396672"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.24.1/charter-0.24.1-linux-x64.tar.gz"
      sha256 "d8f69f94dbfd2a0c06007331041c76283b6c5f7497c2a25dacea6711fa870d96"
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
