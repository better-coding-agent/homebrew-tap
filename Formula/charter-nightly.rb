# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class CharterNightly < Formula
  desc "Command-line access to Charter workspaces (nightly channel)"
  homepage "https://better-coding-agent.com"
  version "0.15.1"

  on_macos do
    on_arm do
      url "https://releases.better-coding-agent.com/cli/nightly/0.15.1/charter-0.15.1-darwin-arm64.tar.gz"
      sha256 "8f34b4dab5798d62fe630587f33c2f4c7031dd4ef6946913047d2f612759ec40"
    end
    on_intel do
      url "https://releases.better-coding-agent.com/cli/nightly/0.15.1/charter-0.15.1-darwin-x64.tar.gz"
      sha256 "5712e7ae315f0bae35d9b06bbc01de8fc75daadb7fae7d96727c0983ef29662f"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.better-coding-agent.com/cli/nightly/0.15.1/charter-0.15.1-linux-arm64.tar.gz"
      sha256 "425ee0a86fc2cc0174ee29f0c9cb8104a15b8af0da94b676a87a46cdbfeefeba"
    end
    on_intel do
      url "https://releases.better-coding-agent.com/cli/nightly/0.15.1/charter-0.15.1-linux-x64.tar.gz"
      sha256 "22213f5a7602f9e4ca9ce40fdd79268b984dbfd0399b84007838f73da0e69cd9"
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
