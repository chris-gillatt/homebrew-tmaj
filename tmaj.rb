class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/homebrew-tmaj"
  url "https://github.com/chris-gillatt/homebrew-tmaj/releases/download/0.0.73/tmaj-0.0.73.tar.gz"
  sha256 "9b73e4dab8c6a25bb7d6004c5c2630797b1c8da6ea50817985b4337ac9ddbe81"
  version "0.0.73"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end