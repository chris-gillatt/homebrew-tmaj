class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/homebrew-tmaj"
  url "https://github.com/chris-gillatt/homebrew-tmaj/releases/download/v0.0.90/tmaj-0.0.90.tar.gz"
  sha256 "57626e721cb956ee8c4a719eb256fdd54182dda5bfc2a4e8555e49753008c9ac"
  version "0.0.90"

  depends_on "curl"
  depends_on "figlet"
  depends_on "cowsay"
  depends_on "lolcat"
  depends_on "coreutils"

  def install
    bin.install "tmaj"
  end
end