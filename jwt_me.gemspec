# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jwt_me/version'

Gem::Specification.new do |spec|
  spec.name          = "jwt_me"
  spec.version       = JwtMe::VERSION
  spec.authors       = ["Jim Jones"]
  spec.email         = ["jim.jones1@gmail.com"]

  spec.summary       = %q{ThredUP Code Exercise: JWT token generation.}
  spec.description   = %q{ThredUP Code Exercise: JWT token generation.}
  spec.homepage      = "https://www.github.com/aantix/jwt_me"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "activemodel", "~> 5.1"
  spec.add_dependency "activesupport", "~> 5.1"
  spec.add_dependency "jwt", "~> 2.0"
  spec.add_dependency "clipboard", "~> 1.1.1"
end
