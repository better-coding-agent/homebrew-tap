# Written by the BCA release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class BcaStaging < Formula
  desc "Command-line access to Better Coding Agent workspaces (staging channel)"
  homepage "https://better-coding-agent.com"
  version "0.3.1"

  on_macos do
    on_arm do
      url "https://releases.better-coding-agent.com/cli/staging/0.3.1/bca-0.3.1-darwin-arm64.tar.gz"
      sha256 "64989aab16f0a7a452efd55759063cda35c9cc81bf0a3c46444139778901709d"
    end
    on_intel do
      url "https://releases.better-coding-agent.com/cli/staging/0.3.1/bca-0.3.1-darwin-x64.tar.gz"
      sha256 "e38574feeb012d38f008be4d1abfe61a71dc3e801e5c27124c4aac9101212ea9"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.better-coding-agent.com/cli/staging/0.3.1/bca-0.3.1-linux-arm64.tar.gz"
      sha256 "07cfecb987d74bb9f84b15246b5d30f2068c3ea11dc70528e70246de220a7225"
    end
    on_intel do
      url "https://releases.better-coding-agent.com/cli/staging/0.3.1/bca-0.3.1-linux-x64.tar.gz"
      sha256 "29d9e608fb0f4d2ff34a64d6401b4ce01c30cb05f11bfb0029f2a258949ca0bc"
    end
  end

  conflicts_with "better-coding-agent/tap/bca", because: "every channel installs the bca command"
  conflicts_with "better-coding-agent/tap/bca-nightly", because: "every channel installs the bca command"

  def install
    bin.install "bca"
  end

  test do
    system bin/"bca", "--version"
  end
end
