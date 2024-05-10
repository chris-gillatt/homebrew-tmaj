class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/homebrew-tmaj"
  url "https://github.com/chris-gillatt/homebrew-tmaj/releases/download/0.0.58/tmaj-0.0.58.tar.gz"
  sha256 "3cdf5a2521b52564bf245e90dc8d7fb7a2fa338732206e5a7202c9569796ff32"
  version "0.0.58"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end