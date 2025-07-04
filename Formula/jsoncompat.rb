class Jsoncompat < Formula
  desc "Escape version skew"
  homepage "https://github.com/ostrowr/jsoncompat"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ostrowr/jsoncompat/releases/download/v#{version}/jsoncompat-macos-aarch64"
      sha256 "f884173c03925204a642fe038b98ee91b2e1ac2b6a988a6f91b6485b82821ada"
      @binary_name = "jsoncompat-macos-aarch64"
    elsif Hardware::CPU.intel?
      url "https://github.com/ostrowr/jsoncompat/releases/download/v#{version}/jsoncompat-macos-x86_64"
      sha256 "0ce61f418ebc741637ce55bcca22cae4a1baea75e162c77c32c9345549e44020"
      @binary_name = "jsoncompat-macos-x86_64"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ostrowr/jsoncompat/releases/download/v#{version}/jsoncompat-linux-x86_64"
      sha256 "d246e6f6ed1f494cb37b233fd2237fce6cfb81846c505429fdd85f56e798dad3"
      @binary_name = "jsoncompat-linux-x86_64"
    end
  end

  def install
    bin.install self.class.instance_variable_get(:@binary_name) => "jsoncompat"
  end
end
