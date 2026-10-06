# Written by the BCA release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class Bca < Formula
  desc "Command-line access to Better Coding Agent workspaces (stable channel)"
  homepage "https://better-coding-agent.com"
  version "0.12.1"

  on_macos do
    on_arm do
      url "https://releases.better-coding-agent.com/cli/nightly/0.12.1/bca-0.12.1-darwin-arm64.tar.gz"
      sha256 "86594886dae358233c99a63af7c8a6f8ac622ae877b6c2a9cba3cc4ea3bfd4d7"
    end
    on_intel do
      url "https://releases.better-coding-agent.com/cli/nightly/0.12.1/bca-0.12.1-darwin-x64.tar.gz"
      sha256 "6b4028b493151757f3f4ce63ae3111d14204952775fdcf43d7e3310933996c8f"
    end
  end

  on_linux do
    on_arm do
      url "https://releases.better-coding-agent.com/cli/nightly/0.12.1/bca-0.12.1-linux-arm64.tar.gz"
      sha256 "24c0e0bbd7b543947bb772d97bfa4ac1c76c13b867394b2284b996319911674a"
    end
    on_intel do
      url "https://releases.better-coding-agent.com/cli/nightly/0.12.1/bca-0.12.1-linux-x64.tar.gz"
      sha256 "9882e9b60591e48ccda832f628319a710821f47018d8add3d96e55b375faca54"
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
