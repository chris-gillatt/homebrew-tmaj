class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/homebrew-tmaj"
  url "https://github.com/chris-gillatt/homebrew-tmaj/releases/download/0.0.57/tmaj-0.0.57.tar.gz"
  sha256 "b54fbbd0cb9c01d962613a37f50f19e68fc298830afc7dab5d3935b3d4a48dae"
  version "0.0.57"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end