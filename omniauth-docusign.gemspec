# -*- encoding: utf-8 -*-

require File.expand_path('../lib/omniauth-docusign/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Jared Moody']
  gem.email         = ['jared@jetbuilt.com']
  gem.description   = 'OmniAuth strategy for DocuSign.'
  gem.summary       = 'OmniAuth strategy for DocuSign.'
  gem.homepage      = 'https://github.com/jetbuilt/omniauth-docusign'
  gem.licenses      = 'MIT'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'omniauth-docusign'
  gem.require_paths = ['lib']
  gem.version       = OmniAuth::DocuSign::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
