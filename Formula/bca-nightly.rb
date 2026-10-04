# Written by the BCA release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class BcaNightly < Formula
  desc "Command-line access to Better Coding Agent workspaces (nightly channel)"
  homepage "https://better-coding-agent.com"
  version "0.4.1"

  on_macos do
    on_arm do
      url "https://releases.better-coding-agent.com/cli/nightly/0.4.1/bca-0.4.1-darwin-arm64.tar.gz"
      sha256 "64268d9a2bfd8282e20ba49539057873eeb61b36d6829146e143110ac357b084"
    end
    on_intel do
      url "https://releases.better-coding-agent.com/cli/nightly/0.4.1/bca-0.4.1-darwin-x64.tar.gz"
      sha256 "f666a7ac1ce96de3f1041f0d9ad8520f386fed678047c265e2e13d0924d3e4c6"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.better-coding-agent.com/cli/nightly/0.4.1/bca-0.4.1-linux-arm64.tar.gz"
      sha256 "366700cee9048a7f55e1d0300037bd41f2b57e084e2ac35f30d6c417f9cb439d"
    end
    on_intel do
      url "https://releases.better-coding-agent.com/cli/nightly/0.4.1/bca-0.4.1-linux-x64.tar.gz"
      sha256 "f09e43a8b1b0da873229613fdef3e1d9afe514649283944b2fb4965cb932d8be"
    end
  end

  conflicts_with "better-coding-agent/tap/bca", because: "every channel installs the bca command"

  def install
    bin.install "bca"
    (libexec/"channel").write "nightly\n"
  end

  test do
    system bin/"bca", "--version"
  end
end
