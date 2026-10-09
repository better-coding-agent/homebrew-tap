# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class Charter < Formula
  desc "Command-line access to Charter workspaces (stable channel)"
  homepage "https://charter.build"
  version "0.22.1"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.22.1/charter-0.22.1-darwin-arm64.tar.gz"
      sha256 "b18d0b1f4a8a5f3f538955b3ec759303d6fd6a5c799622e49bb46ad1298e4547"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.22.1/charter-0.22.1-darwin-arm64.tar.gz"
        sha256 "b18d0b1f4a8a5f3f538955b3ec759303d6fd6a5c799622e49bb46ad1298e4547"
      else
        url "https://releases.charter.build/cli/nightly/0.22.1/charter-0.22.1-darwin-x64.tar.gz"
        sha256 "10377bc7e9604f5b8601e49ea5e0c61628314e504274334e6ef8886f55e154fa"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.22.1/charter-0.22.1-linux-arm64.tar.gz"
      sha256 "40a4e91fe4500f9a68b5c013ac277dee1e40a1995a8e5b7c4ae01984152a82fe"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.22.1/charter-0.22.1-linux-x64.tar.gz"
      sha256 "f99e359f62429798388ceee28e540b20e1f0fc10e6a17080e9bba40d7df37ba7"
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
