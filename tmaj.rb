class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/homebrew-tmaj"
  url "https://github.com/chris-gillatt/homebrew-tmaj/releases/download/0.0.77/tmaj-0.0.77.tar.gz"
  sha256 "77e0cbe7cc72a12c4a237ec00bbb41429af58b1b889c096c5efcbe5e42b29e4a"
  version "0.0.77"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end