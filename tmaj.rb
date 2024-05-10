class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/tmaj"
  url "https://github.com/chris-gillatt/tmaj/releases/download/0.0.48/tmaj-0.0.48.tar.gz"
  sha256 "ad3c069ccac885e718dcd722b4e68cdc2a5f9f2d66dd702558f7dd39bd49ebf0"
  version "0.0.48"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end