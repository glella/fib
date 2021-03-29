require "fib/ffi"
require "fib/version"

module Fib
  def self.[](n)
    FFI.fib(n)
  end
end
