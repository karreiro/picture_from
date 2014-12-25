# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'picture_from/version'

Gem::Specification.new do |spec|
  spec.name          = 'picture_from'
  spec.version       = PictureFrom::VERSION
  spec.authors       = ['Guilherme Carreiro']
  spec.email         = ['karreiro@gmail.com']
  spec.homepage      = 'https://github.com/karreiro/picture_from'
  spec.license       = 'MIT'
  spec.description   = 'A gem for getting profile pictures.'
  spec.summary       = 'PictureFrom is the most efficient library for getting '\
                       'profile pictures.'

  spec.files         = `git ls-files`.split($RS)
  spec.executables   = spec.files.grep(/^bin\//) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(/^spec\//)
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'nokogiri', '~> 1.6'

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'fakeweb', '~> 1.3'
  spec.add_development_dependency 'rubocop', '~> 0.28'
  spec.add_development_dependency 'rake', '~> 10.4'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'mocha', '~> 0.14'
  spec.add_development_dependency 'simplecov', '~> 0.9'

end
