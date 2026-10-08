# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class CharterNightly < Formula
  desc "Command-line access to Charter workspaces (nightly channel)"
  homepage "https://charter.build"
  version "0.19.1"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.19.1/charter-0.19.1-darwin-arm64.tar.gz"
      sha256 "6509652b3404f30c15830a9c39300043c968deee8eccd3a429508a1286334568"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.19.1/charter-0.19.1-darwin-arm64.tar.gz"
        sha256 "6509652b3404f30c15830a9c39300043c968deee8eccd3a429508a1286334568"
      else
        url "https://releases.charter.build/cli/nightly/0.19.1/charter-0.19.1-darwin-x64.tar.gz"
        sha256 "e5b00cbf0c26a9452e28d953ba507dec5838f9be7624462dd4f402718df3658c"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.19.1/charter-0.19.1-linux-arm64.tar.gz"
      sha256 "0bb8c83a9d7aa4a7a12a0af61833cbd78c494b54453d8a8a29142fff089855db"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.19.1/charter-0.19.1-linux-x64.tar.gz"
      sha256 "bfede53c8838f689ad1f9bde884786ca94dd9af2dcff288696d91710e6a7a00f"
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
