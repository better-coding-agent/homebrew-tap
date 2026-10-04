# Written by the BCA release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class BcaNightly < Formula
  desc "Command-line access to Better Coding Agent workspaces (nightly channel)"
  homepage "https://better-coding-agent.com"
  version "0.8.1"

  on_macos do
    on_arm do
      url "https://releases.better-coding-agent.com/cli/nightly/0.8.1/bca-0.8.1-darwin-arm64.tar.gz"
      sha256 "3d63ec16b6c41504e2274e564377b258faec65e4750f06df870341799bcf5b93"
    end
    on_intel do
      url "https://releases.better-coding-agent.com/cli/nightly/0.8.1/bca-0.8.1-darwin-x64.tar.gz"
      sha256 "495d6aa5e9053ed552d04a5e21f151d45106e59ddb9b7d924feb9ed21df35cd8"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.better-coding-agent.com/cli/nightly/0.8.1/bca-0.8.1-linux-arm64.tar.gz"
      sha256 "0c7d60918582101201fa7cba21f7da002c018bbc54b960f51bd35c0a99930699"
    end
    on_intel do
      url "https://releases.better-coding-agent.com/cli/nightly/0.8.1/bca-0.8.1-linux-x64.tar.gz"
      sha256 "15f874659113c6bf6afe7ed1aee1fa8ce9b12ec619ad3970c45c38249b25ee51"
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
