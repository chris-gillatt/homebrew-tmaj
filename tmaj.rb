class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/tmaj"
  url "https://github.com/chris-gillatt/tmaj/releases/download/0.0.49/tmaj-0.0.49.tar.gz"
  sha256 "ad16d75932bad12052e8bb454dfa0c8f5c5013e3fa9c76521ed53d764562ffd4"
  version "0.0.49"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end