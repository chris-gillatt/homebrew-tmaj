class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/homebrew-tmaj"
  url "https://github.com/chris-gillatt/homebrew-tmaj/releases/download/0.0.68/tmaj-0.0.68.tar.gz"
  sha256 "416f0acafc969b48e0a9fb6fa17780198ab5340e5305e985b5aef8bc4e165455"
  version "0.0.68"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end