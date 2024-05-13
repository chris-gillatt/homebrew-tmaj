class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/homebrew-tmaj"
  url "https://github.com/chris-gillatt/homebrew-tmaj/releases/download/v0.0.82/tmaj-0.0.82.tar.gz"
  sha256 "613941545851381f01916aa1b24111af62d033b1fa66585bf9ca87858beb6ce5"
  version "0.0.82"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end