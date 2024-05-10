class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/tmaj"
  url "https://github.com/chris-gillatt/tmaj/releases/download/0.0.46/tmaj-0.0.46.tar.gz"
  sha256 "2a80f2d83b5341d90de813e24ff7d4b03ea5eadeb6842673677f614f2cc59721"
  version "0.0.46"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end