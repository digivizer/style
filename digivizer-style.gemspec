# encoding: utf-8

require 'English'

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'digivizer-style'
  spec.version       = '4.0'
  spec.authors       = ['Digivizer Developer']
  spec.email         = ['dev-accounts@digivizer.com']
  spec.description   = 'The Digivizer Manual of Style'
  spec.summary       = 'This gem contains a rubocop configuration for Digivizer'
  spec.homepage      = ''
  spec.license       = 'MIT'
  spec.metadata      = { "github_repo" => "https://github.com/digivizer/style.git" }

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rubocop', '>= 0.53', '< 2.0'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'danger'
  spec.add_development_dependency 'danger-rubocop'
end
