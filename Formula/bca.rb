# Written by the BCA release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class Bca < Formula
  desc "Command-line access to Better Coding Agent workspaces (stable channel)"
  homepage "https://better-coding-agent.com"
  version "0.10.1"

  on_macos do
    on_arm do
      url "https://releases.better-coding-agent.com/cli/nightly/0.10.1/bca-0.10.1-darwin-arm64.tar.gz"
      sha256 "a6ae85f39e0eee0d1dd1c9fb0551148a75f7ede297548f600459f2e3d5cc6c0c"
    end
    on_intel do
      url "https://releases.better-coding-agent.com/cli/nightly/0.10.1/bca-0.10.1-darwin-x64.tar.gz"
      sha256 "3e8d495c875769883f799e4a938216157033adf39178a78806163223e42818a2"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.better-coding-agent.com/cli/nightly/0.10.1/bca-0.10.1-linux-arm64.tar.gz"
      sha256 "5f11e09c800bafded00142e6cd3ce8ad965820e2f0cea02e2ee219040d0ceebd"
    end
    on_intel do
      url "https://releases.better-coding-agent.com/cli/nightly/0.10.1/bca-0.10.1-linux-x64.tar.gz"
      sha256 "e53fec0afc50526408c4cd418e38d9122934d2e4eb719fa5bce17a5b5cfbe13e"
    end
  end

  conflicts_with "better-coding-agent/tap/bca-nightly", because: "every channel installs the bca command"

  def install
    bin.install "bca"
    (libexec/"channel").write "stable\n"
  end

  test do
    system bin/"bca", "--version"
  end
end
