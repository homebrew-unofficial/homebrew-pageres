require "language/node"

class PageresCli < Formula
  version "5.0.0"

  desc "Capture website screenshots"
  homepage "https://github.com/sindresorhus/pageres-cli"
  url "https://github.com/sindresorhus/pageres-cli/archive/v#{version}.tar.gz"
  sha256 "41eb28cad60154f740195d2e73269e912bb6c7a0d46682a252168c3c2cac8077"

  depends_on "node" => :build

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert shell_output("#{bin}/pageres -h").strip.start_with?("Capture website screenshots")
  end
end
