# Written by the Charter release (cli/scripts/homebrew-formula.ts); edits here are replaced by the next release.
class CharterNightly < Formula
  desc "Command-line access to Charter workspaces (nightly channel)"
  homepage "https://charter.build"
  version "0.20.1"

  on_macos do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.20.1/charter-0.20.1-darwin-arm64.tar.gz"
      sha256 "a9f0bab875b114fb76d599539ff350fdda70d442d4026820b9c42cbdd8368df3"
    end
    on_intel do
      # An Intel Homebrew on Apple silicon runs under Rosetta, which lacks the AVX the Intel build needs; the Apple
      # silicon binary runs natively there.
      if Hardware::CPU.in_rosetta2?
        url "https://releases.charter.build/cli/nightly/0.20.1/charter-0.20.1-darwin-arm64.tar.gz"
        sha256 "a9f0bab875b114fb76d599539ff350fdda70d442d4026820b9c42cbdd8368df3"
      else
        url "https://releases.charter.build/cli/nightly/0.20.1/charter-0.20.1-darwin-x64.tar.gz"
        sha256 "2a14f8cb5ff72ac01d858e751fd28a5737d15fd08ef2b313ed876c5901a4f689"
      end
    end
  end

  on_linux do
    on_arm do
      url "https://releases.charter.build/cli/nightly/0.20.1/charter-0.20.1-linux-arm64.tar.gz"
      sha256 "c39068ba8b0a9b9f122687f634c8dab4f390beea1140ec7058ed014426db26ca"
    end
    on_intel do
      url "https://releases.charter.build/cli/nightly/0.20.1/charter-0.20.1-linux-x64.tar.gz"
      sha256 "45b310181338397795056d748dd573031e33341f87b215b72a739fd57591933f"
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
