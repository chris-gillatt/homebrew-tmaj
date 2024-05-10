class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/tmaj"
  url "https://github.com/chris-gillatt/tmaj/releases/download/0.0.52/tmaj-0.0.52.tar.gz"
  sha256 "7da06218b3c81d1ca5c99dab1b726fb8a6b7d53fe5d4df3bb67e05bb5585efa8"
  version "0.0.52"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end