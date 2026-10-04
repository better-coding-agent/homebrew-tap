# Written by the BCA release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class BcaNightly < Formula
  desc "Command-line access to Better Coding Agent workspaces (nightly channel)"
  homepage "https://better-coding-agent.com"
  version "0.9.1"

  on_macos do
    on_arm do
      url "https://releases.better-coding-agent.com/cli/nightly/0.9.1/bca-0.9.1-darwin-arm64.tar.gz"
      sha256 "28abff14e6a4cc84aaad4467ce88e637af44847708745a2420ba9a06e8834ec7"
    end
    on_intel do
      url "https://releases.better-coding-agent.com/cli/nightly/0.9.1/bca-0.9.1-darwin-x64.tar.gz"
      sha256 "cba59bc15b3f816d894e70bae255066908474405246dd7c7e6f743332be96d52"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.better-coding-agent.com/cli/nightly/0.9.1/bca-0.9.1-linux-arm64.tar.gz"
      sha256 "f98b9615f7ddf7a7ef53c0d16115e80a7d265f3f06e6a0b9ef45de10742e375a"
    end
    on_intel do
      url "https://releases.better-coding-agent.com/cli/nightly/0.9.1/bca-0.9.1-linux-x64.tar.gz"
      sha256 "750c9877615bbbb50643f55beca080c73de7997e2ce9392d6b9df1f04670c8ab"
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
