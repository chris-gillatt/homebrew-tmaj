class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/homebrew-tmaj"
  url "https://github.com/chris-gillatt/homebrew-tmaj/releases/download/v0.0.89/tmaj-0.0.89.tar.gz"
  sha256 "5614431bd2862096766f7ff2a913a8c17f2b6d62b1a93aea9bf00d240fcc1464"
  version "0.0.89"

  depends_on "curl"
  depends_on "figlet"
  depends_on "cowsay"
  depends_on "lolcat"
  depends_on "coreutils"

  def install
    bin.install "tmaj"
  end
end