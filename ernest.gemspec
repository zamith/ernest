# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ernest/version'

Gem::Specification.new do |spec|
  spec.name          = "ernest"
  spec.version       = Ernest::VERSION
  spec.authors       = ["Zamith"]
  spec.email         = ["zamith@groupbuddies.com"]
  spec.summary       = %q{Ernest makes it easy to create blog post drafts.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   << 'ernest'
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "dotenv"
  spec.add_dependency "httparty"
  spec.add_dependency "metadown"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
