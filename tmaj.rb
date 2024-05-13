class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/homebrew-tmaj"
  url "https://github.com/chris-gillatt/homebrew-tmaj/releases/download/v0.0.85/tmaj-0.0.85.tar.gz"
  sha256 "017fd9c381e4c705cf742a4f026f27d9b948b8bddc5727fbf600822c2041016e"
  version "0.0.85"

  depends_on "curl"
  depends_on "figlet"
  depends_on "cowsay"
  depends_on "lolcat"
  depends_on "coreutils"

  def install
    bin.install "tmaj"
  end

  test do
    system bin/"tmaj"
  end
end