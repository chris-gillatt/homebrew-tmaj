class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/tmaj"
  url "https://github.com/chris-gillatt/tmaj/releases/download/0.0.55/tmaj-0.0.55.tar.gz"
  sha256 "588e4a3288fce8526fa16fe4f185520a2a82c68a89f946c6196a03483879cd94"
  version "0.0.55"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end