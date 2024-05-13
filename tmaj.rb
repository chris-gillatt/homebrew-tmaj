class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/homebrew-tmaj"
  url "https://github.com/chris-gillatt/homebrew-tmaj/releases/download/0.0.81/tmaj-0.0.81.tar.gz"
  sha256 "f79d700c49248d570404f6ab4cdb2a6d89aa166fcb2ddbdf86f82c71c5edc48c"
  version "0.0.81"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end