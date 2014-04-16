# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nodepost/version'

Gem::Specification.new do |spec|
  spec.name          = "nodepost"
  spec.version       = Nodepost::VERSION
  spec.authors       = ["Neil Berget"]
  spec.email         = ["neil.berget@gmail.com"]
  spec.summary       = %q{Simple tool to query nodegroups.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['nodepost']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "awesome_print"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
