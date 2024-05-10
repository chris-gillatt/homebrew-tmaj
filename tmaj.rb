class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/tmaj"
  url "https://github.com/chris-gillatt/tmaj/releases/download/0.0.47/tmaj-0.0.47.tar.gz"
  sha256 "98be149a2cfb4c9f0d478eed8ba71f1309da99c9e2360bf5e9d075cd1b834976"
  version "0.0.47"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end