# Written by the BCA release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class BcaNightly < Formula
  desc "Command-line access to Better Coding Agent workspaces (nightly channel)"
  homepage "https://better-coding-agent.com"
  version "0.14.1"

  on_macos do
    on_arm do
      url "https://releases.better-coding-agent.com/cli/nightly/0.14.1/bca-0.14.1-darwin-arm64.tar.gz"
      sha256 "5b12b40a52646fb4cf5a33801f2309349f47500729bb151297a055fac21757a2"
    end
    on_intel do
      url "https://releases.better-coding-agent.com/cli/nightly/0.14.1/bca-0.14.1-darwin-x64.tar.gz"
      sha256 "a4354e395015fa5445eb922e608f58e2bdc1e2532982ee027584ec5b8fe526d7"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.better-coding-agent.com/cli/nightly/0.14.1/bca-0.14.1-linux-arm64.tar.gz"
      sha256 "bae9c64ba5f140a19783a78ade8fb2c3ed7ca14d3485091df95e0ec6ec7ff734"
    end
    on_intel do
      url "https://releases.better-coding-agent.com/cli/nightly/0.14.1/bca-0.14.1-linux-x64.tar.gz"
      sha256 "e4b26f0d971080ad7c14648ea1045186c5291f5536c460deaf19c0985c4a3670"
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
