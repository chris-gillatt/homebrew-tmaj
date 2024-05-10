class Tmaj < Formula
  desc "Prints a random joke on the command-line"
  homepage "https://github.com/chris-gillatt/tmaj"
  url "https://github.com/chris-gillatt/tmaj/releases/download/0.0.53/tmaj-0.0.53.tar.gz"
  sha256 "b7b7ed893ca93cc76d90adfa851a7b31d9b75afccc4f2b232ce47f209ff3f1e2"
  version "0.0.53"

  depends_on ["curl", "figlet", "cowsay", "lolcat", "coreutils"]

  def install
    bin.install "tmaj"
  end
end