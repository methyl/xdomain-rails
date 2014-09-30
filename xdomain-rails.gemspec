# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xdomain_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "xdomain-rails"
  spec.version       = XdomainRails::VERSION
  spec.authors       = ["Lucjan Suski"]
  spec.email         = ["lucjansuski@gmail.com"]
  spec.description   = %q{Xdomain gem for Rails}
  spec.summary       = %q{Xdomain gem for Rails}
  spec.homepage      = "https://github.com/methyl"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_dependency "railties", [">= 3.1.0"]
  spec.add_development_dependency "rake"
end
