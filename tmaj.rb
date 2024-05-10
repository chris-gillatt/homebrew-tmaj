class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/tmaj"
  url "https://github.com/chris-gillatt/tmaj/releases/download/0.0.50/tmaj-0.0.50.tar.gz"
  sha256 "1eef342c18bdc6aec9b26f37da771b15920e76213adf971248882b2aef59bd4c"
  version "0.0.50"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end