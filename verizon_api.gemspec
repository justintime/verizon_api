# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'verizon_api/version'

Gem::Specification.new do |spec|
  spec.name          = "verizon_api"
  spec.version       = VerizonApi::VERSION
  spec.authors       = ["Justin Ellison"]
  spec.email         = ["justin@techadvise.com"]

  spec.summary       = %q{Interact with Verizon's (EdgeCast) API.}
  spec.description   = %q{This gem allows you to view/modify your ADN and WAF configurations.}
  spec.homepage      = "http://github.com/justintime/verizon_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "hashdiff"

  spec.add_dependency "httparty"
  spec.add_dependency "json"

end
