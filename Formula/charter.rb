# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class Charter < Formula
  desc "Command-line access to Charter workspaces (stable channel)"
  homepage "https://charter.build"
  version "0.25.1"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.25.1/charter-0.25.1-darwin-arm64.tar.gz"
      sha256 "43a67edb8a37b79f8271defeec73e460d4a2f5825366f2b184ebe0b59580959f"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.25.1/charter-0.25.1-darwin-arm64.tar.gz"
        sha256 "43a67edb8a37b79f8271defeec73e460d4a2f5825366f2b184ebe0b59580959f"
      else
        url "https://releases.charter.build/cli/nightly/0.25.1/charter-0.25.1-darwin-x64.tar.gz"
        sha256 "47c4592c9f2553ee71f66c8f2955467eedbae852cb672985fec05f2f406d01bc"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.25.1/charter-0.25.1-linux-arm64.tar.gz"
      sha256 "8d8d485536d89c0f17c0251a91935d421342e8e2e668ce5456b2273f370a882b"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.25.1/charter-0.25.1-linux-x64.tar.gz"
      sha256 "c8234612294710559f23d039a57be7b818aedc4bd018f3016906af6cc652f5f7"
    end
  end

  conflicts_with "charter-build/tap/charter-nightly", because: "every channel installs the charter command"

  def install
    bin.install "charter"
    (libexec/"channel").write "stable\n"
  end

  test do
    system bin/"charter", "--version"
  end
end
