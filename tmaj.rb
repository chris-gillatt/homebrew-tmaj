class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/homebrew-tmaj"
  url "https://github.com/chris-gillatt/homebrew-tmaj/releases/download/v0.0.86/tmaj-0.0.86.tar.gz"
  sha256 "cc2cc6085f30966ad9fd5be019b9ce03754cf570ed4dc597776436e47abb6d46"
  version "0.0.86"

  depends_on "curl"
  depends_on "figlet"
  depends_on "cowsay"
  depends_on "lolcat"
  depends_on "coreutils"

  def install
    bin.install "tmaj"
  end

  test do
    system bin/"tmajssss"
  end
end