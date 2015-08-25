require "formula"

class GrOsmosdr < Formula
  homepage "http://sdr.osmocom.org/trac/wiki/GrOsmoSDR"
  url "http://cgit.osmocom.org/gr-osmosdr/snapshot/gr-osmosdr-0.1.4.tar.gz"
  sha1 "672041a6ffa767d39ffad2432e2a13c11e3ec984"

  depends_on "cmake" => :build

  def install
    mkdir "build" do
      args = []
      args << "-DPYTHON_EXECUTABLE='#{%x(python-config --prefix).chomp}/bin/python'"
      args << "-DPYTHON_INCLUDE_DIR='#{%x(python-config --prefix).chomp}/include/python2.7'"
      args << "-DPYTHON_LIBRARY='#{%x(python-config --prefix).chomp}/lib/libpython2.7.dylib'"

      system "cmake", "..", *args, *std_cmake_args
      system "make", "install"
    end
  end

  test do
    system "false"
  end
end
