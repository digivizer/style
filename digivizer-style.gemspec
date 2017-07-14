# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'digivizer-style'
  spec.version       = '1.1'
  spec.authors       = ['Digivizer Developer']
  spec.email         = ['dev-accounts@digivizer.com']
  spec.description   = 'The Digivizer Manual of Style'
  spec.summary       = 'This gem contains a rubocop configuration for Digivizer'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rubocop', '~> 0.45'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 11.2'
  spec.add_development_dependency 'rspec', '~> 3.5'
end
