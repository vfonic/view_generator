# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'view_generator/version'

Gem::Specification.new do |gem|
  gem.name          = "view_generator"
  gem.version       = ViewGenerator::VERSION
  gem.author        = "Viktor Fonic"
  gem.email         = ["viktor.fonic@gmail.com"]
  gem.description   = %q{Generator of views for existing models}
  gem.summary       = %q{Generates views for existing model passed as argument}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
