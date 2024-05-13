class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/homebrew-tmaj"
  url "https://github.com/chris-gillatt/homebrew-tmaj/releases/download/v0.0.83/tmaj-0.0.83.tar.gz"
  sha256 "9cc996caeca5ab3d8c6b219408cd132179a913b2528c9ddf544b773e345aaaed"
  version "0.0.83"

  depends_on "curl" 
  depends_on "figlet", 
  depends_on "cowsay", 
  depends_on "lolcat", 
  depends_on "coreutils"

  def install
    bin.install "tmaj"
  end
end