class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/tmaj"
  url "https://github.com/chris-gillatt/tmaj/releases/download/0.0.51/tmaj-0.0.51.tar.gz"
  sha256 "55700d77bbdf9d905a7b4c5fbf4e8808c69118d86e45e0424d7800fe6fc528bb"
  version "0.0.51"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end