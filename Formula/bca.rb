# Written by the BCA release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class Bca < Formula
  desc "Command-line access to Better Coding Agent workspaces (stable channel)"
  homepage "https://better-coding-agent.com"
  version "0.13.1"

  on_macos do
    on_arm do
      url "https://releases.better-coding-agent.com/cli/nightly/0.13.1/bca-0.13.1-darwin-arm64.tar.gz"
      sha256 "02b1b75d8e81e4cf9fd40325abd7af10b959a6ec5784d4914709f5c3b87133f2"
    end
    on_intel do
      url "https://releases.better-coding-agent.com/cli/nightly/0.13.1/bca-0.13.1-darwin-x64.tar.gz"
      sha256 "43822b9e058e40450f9259bb267b13b9f7c02e9b1e90628598192b03286ad684"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.better-coding-agent.com/cli/nightly/0.13.1/bca-0.13.1-linux-arm64.tar.gz"
      sha256 "3baefa4f61d3962c4980c2db404213268672242c3804967ed24ea14a1c0b29e8"
    end
    on_intel do
      url "https://releases.better-coding-agent.com/cli/nightly/0.13.1/bca-0.13.1-linux-x64.tar.gz"
      sha256 "350705c04a78a860771e74a17a9f90227877983f785e8e38f9784c691ab2a9c0"
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
