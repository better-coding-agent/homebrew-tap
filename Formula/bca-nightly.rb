# Written by the BCA release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class BcaNightly < Formula
  desc "Command-line access to Better Coding Agent workspaces (nightly channel)"
  homepage "https://better-coding-agent.com"
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://releases.better-coding-agent.com/cli/nightly/0.3.1/bca-0.3.1-darwin-arm64.tar.gz"
      sha256 "e3034673e827aa5b0418073a670e7e24ad45850b402da9f94cc43e822b32ff82"
    end
    on_intel do
      url "https://releases.better-coding-agent.com/cli/nightly/0.3.1/bca-0.3.1-darwin-x64.tar.gz"
      sha256 "7521267d4c25c16c4b732c7fae24fa8d86679fdbe53c38a9c87887865d2dade3"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.better-coding-agent.com/cli/nightly/0.3.1/bca-0.3.1-linux-arm64.tar.gz"
      sha256 "042e2690513ea426a62d0e8bdec56bb94e9741a95bce75d14054e06ad0a136e5"
    end
    on_intel do
      url "https://releases.better-coding-agent.com/cli/nightly/0.3.1/bca-0.3.1-linux-x64.tar.gz"
      sha256 "43654586021989e5e4af8111e369ce56d04e13c718c08a4c07d4472a5b8e8887"
    end
  end

  conflicts_with "better-coding-agent/tap/bca", because: "every channel installs the bca command"
  conflicts_with "better-coding-agent/tap/bca-staging", because: "every channel installs the bca command"

  def install
    bin.install "bca"
  end

  test do
    system bin/"bca", "--version"
  end
end
