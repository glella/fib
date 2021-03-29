require 'fiddle/import'

module Fib
  module FFI
    extend Fiddle::Importer
    dlload File.expand_path('libfib.so', __dir__)
    # Mac : libfib.dylib, Win : libfib.dll
    extern 'unsigned int fib(unsigned int n)' # like C language
  end
end
