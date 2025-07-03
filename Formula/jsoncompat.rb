class Jsoncompat < Formula
  desc "Escape version skew"
  homepage "https://github.com/ostrowr/jsoncompat"
  version "0.1.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/ostrowr/jsoncompat/releases/download/v#{version}/jsoncompat-macos-aarch64"
      sha256 "ef6e5628945b2680c0d6389d80cb2a7bb6621302815aea18a989f684a3a922b4"
      @binary_name = "jsoncompat-macos-aarch64"
    elsif Hardware::CPU.intel?
      url "https://github.com/ostrowr/jsoncompat/releases/download/v#{version}/jsoncompat-macos-x86_64"
      sha256 "7ff7cd2485244a14faccf11e2b3d949ace36f5e2f655b55b70a31632d5d32964"
      @binary_name = "jsoncompat-macos-x86_64"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/ostrowr/jsoncompat/releases/download/v#{version}/jsoncompat-linux-x86_64"
      sha256 "c24e6adae82fa4f7ec5d834f4bcc50e85cbe83df861b62439fb9b74a9f2c38ba"
      @binary_name = "jsoncompat-linux-x86_64"
    end
  end

  def install
    bin.install self.class.instance_variable_get(:@binary_name) => "jsoncompat"
  end
end
