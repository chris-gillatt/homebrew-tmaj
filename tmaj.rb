class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/homebrew-tmaj"
  url "https://github.com/chris-gillatt/homebrew-tmaj/releases/download/v0.0.84/tmaj-0.0.84.tar.gz"
  sha256 "4bc1f66496e294ed2e2deb4a084fd24d0c13d0a3c7b5b70331e54329e0978976"
  version "0.0.84"

  depends_on "curl"
  depends_on "figlet"
  depends_on "cowsay"
  depends_on "lolcat"
  depends_on "coreutils"

  def install
    bin.install "tmaj"
  end
end