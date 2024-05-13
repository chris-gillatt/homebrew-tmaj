class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/homebrew-tmaj"
  url "https://github.com/chris-gillatt/homebrew-tmaj/releases/download/v0.0.87/tmaj-0.0.87.tar.gz"
  sha256 "423401271f9939489b4fac37ebae16af5596d30e6c6651d99a8f96d992f39cd1"
  version "0.0.87"

  depends_on "curl"
  depends_on "figlet"
  depends_on "cowsay"
  depends_on "lolcat"
  depends_on "coreutils"

  def install
    bin.install "tmaj"
  end
end