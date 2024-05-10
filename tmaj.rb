class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/tmaj"
  url "https://github.com/chris-gillatt/tmaj/releases/download/0.0.54/tmaj-0.0.54.tar.gz"
  sha256 "60f94ded6ed3dbc82f4828b41c57a27559ae0031d7f14eace923425fa8b65ca1"
  version "0.0.54"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end