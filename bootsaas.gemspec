# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bootsaas/version'

Gem::Specification.new do |spec|
  spec.name          = "bootsaas"
  spec.version       = Bootsaas::VERSION
  spec.authors       = ["Spencer Dixon"]
  spec.email         = ["spencerlloyddixon@gmail.com"]
  spec.summary       = "BootSaaS sets up your application and generates basic layouts to get your app started"
  spec.description   = "BootSaaS sets up your application and generates basic layouts to get your app started"
  spec.homepage      = "https://github.com/spencerldixon/BootSaaS"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
