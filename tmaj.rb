class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/tmaj"
  url "https://github.com/chris-gillatt/tmaj/releases/download/0.0.42/tmaj-0.0.42.tar.gz"
  sha256 "5faa19100905fbf2c6b48f0db77494e9eeb6400afde1851b48c7dd2256111fa4"
  version "0.0.42"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end