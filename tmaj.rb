class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/homebrew-tmaj"
  url "https://github.com/chris-gillatt/homebrew-tmaj/releases/download/v0.0.88/tmaj-0.0.88.tar.gz"
  sha256 "99324d0819d70f4d1063f7e7c174f20bc25cfb432a5be862b97295a3654833de"
  version "0.0.88"

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