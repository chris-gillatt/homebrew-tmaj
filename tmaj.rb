class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/homebrew-tmaj"
  url "https://github.com/chris-gillatt/homebrew-tmaj/releases/download/0.0.79/tmaj-0.0.79.tar.gz"
  sha256 "19cc2947a8bdefe040b4e75e15f39c6481f52f4e2b692a67a71058156203fccd"
  version "0.0.79"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end