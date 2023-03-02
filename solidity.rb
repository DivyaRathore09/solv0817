class Solidity < Formula
  desc "The Solidity Contract-Oriented Programming Language"
  homepage "https://docs.soliditylang.org"
  url "https://github.com/ethereum/solidity/releases/download/v0.8.17/solidity_0.8.17.tar.gz"
  version "0.8.17"
  sha256 "b0337ab0125be7e54461ab76b6e483f5e912d3f3e4b0c89bd00cfb0a3d6a5afd"

  depends_on "cmake" => :build
  depends_on "boost" => "c++11"
  # Note: due to a homebrew limitation, ccache will always be detected and cannot be turned off.
  depends_on "ccache" => :build
  depends_on "z3"

  def install
    system "cmake", ".", *std_cmake_args, "-DTESTS=OFF"
    system "make", "install"
  end

  test do
    system "#{bin}/solc", "--version"
  end
end
