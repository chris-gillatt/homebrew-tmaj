class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/homebrew-tmaj"
  url "https://github.com/chris-gillatt/homebrew-tmaj/releases/download/0.0.80/tmaj-0.0.80.tar.gz"
  sha256 "e7f470a9b486e2f2f65318d94e8ffbc6e7bfd4dc478896f0b3342634400ff09e"
  version "0.0.80"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end