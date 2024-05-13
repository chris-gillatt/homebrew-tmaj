class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/homebrew-tmaj"
  url "https://github.com/chris-gillatt/homebrew-tmaj/releases/download/0.0.61/tmaj-0.0.61.tar.gz"
  sha256 ""
  version "0.0.61"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end