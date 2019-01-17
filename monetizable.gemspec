# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'monetizable/version'

Gem::Specification.new do |spec|
  spec.name          = "monetizable"
  spec.version       = Monetizable::VERSION
  spec.authors       = ["Kyle Wiest"]
  spec.email         = ["kyle.wiest@gmail.com"]
  spec.description   = %q{Monetize attributes on your objects.}
  spec.summary       = %q{Monetize attributes on your objects.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake"
  
  spec.add_dependency 'monetize', '~> 1.9.0'
  spec.add_dependency "money", "~> 6.13.2"
end
