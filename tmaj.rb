class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/homebrew-tmaj"
  url "https://github.com/chris-gillatt/homebrew-tmaj/releases/download/0.0.76/tmaj-0.0.76.tar.gz"
  sha256 "a36c3957b1bcc6ee03c70c67af55b7cc86bdbbcd9fef1aede4ddd924cad7ee6e"
  version "0.0.76"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end