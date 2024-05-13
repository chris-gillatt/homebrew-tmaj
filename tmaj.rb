class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/homebrew-tmaj"
  url "https://github.com/chris-gillatt/homebrew-tmaj/releases/download/0.0.78/tmaj-0.0.78.tar.gz"
  sha256 "55bab12977ce48e2ed21b824aa3a8d246248f1f4d2c9473999cc86aaad6e6b52"
  version "0.0.78"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end