class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/tmaj"
  url "https://github.com/chris-gillatt/tmaj/releases/download/0.0.40/tmaj-0.0.40.tar.gz"
  sha256 "cb3dba0e89e8c27c2a2aa8f3760d8ff0648d8788849c77687af23f5ab52eed6c"
  version "0.0.40"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end