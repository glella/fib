# frozen_string_literal: true

require_relative "lib/fib/version"

Gem::Specification.new do |spec|
  spec.name          = "fib"
  spec.version       = Fib::VERSION
  spec.authors       = ["Guillermo Lella"]
  spec.email         = ["arkorott@gmail.com"]
  spec.summary       = "Get the fibonacci number."
  spec.license       = "MIT"
  spec.files         = Dir['lib/**/*', 'src/**/*.rs', 'Cargo.toml', 'LICENSE', 'README.md']
  spec.require_paths = ["lib"]

end
