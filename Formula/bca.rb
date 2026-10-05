# Written by the BCA release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class Bca < Formula
  desc "Command-line access to Better Coding Agent workspaces (stable channel)"
  homepage "https://better-coding-agent.com"
  version "0.11.1"

  on_macos do
    on_arm do
      url "https://releases.better-coding-agent.com/cli/nightly/0.11.1/bca-0.11.1-darwin-arm64.tar.gz"
      sha256 "4448358726b0bc4ee6f06401acb048a85adf7889ffb16542047b4be43b3a9b29"
    end
    on_intel do
      url "https://releases.better-coding-agent.com/cli/nightly/0.11.1/bca-0.11.1-darwin-x64.tar.gz"
      sha256 "99412bfc00b5639ad43ca45ff1ae99417529d0bb39649cd1ada0cbcb0efed51a"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.better-coding-agent.com/cli/nightly/0.11.1/bca-0.11.1-linux-arm64.tar.gz"
      sha256 "367b40482638f1f9021f06ad5f8b8ed6884c0b623502735bdf8a278944fb0830"
    end
    on_intel do
      url "https://releases.better-coding-agent.com/cli/nightly/0.11.1/bca-0.11.1-linux-x64.tar.gz"
      sha256 "1c63b9d9ad00ab28ac01fb6041d07fb8eb5a69c691eea6b2a5fa39aa85be5026"
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
