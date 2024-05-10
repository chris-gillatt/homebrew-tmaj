class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/homebrew-tmaj"
  url "https://github.com/chris-gillatt/homebrew-tmaj/releases/download/0.0.56/tmaj-0.0.56.tar.gz"
  sha256 "e1a96fd17b122ecaed85429565bfb2d43b9330128f55d1a5ad994e82d85289e7"
  version "0.0.56"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end