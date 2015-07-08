# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'camel_snake/version'

Gem::Specification.new do |spec|
  spec.name          = "camel_snake"
  spec.version       = CamelSnake::VERSION
  spec.authors       = ["Peter Anderson"]
  spec.email         = ["peter@peteranderson.me"]
  spec.summary       = %q{Converts camelCase keys in a hash to snake_case (and vice versa). This is handy when implmenting a JSON API interface that uses camelCase notation}
  spec.description   = nil
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
