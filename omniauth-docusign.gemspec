# frozen_string_literal: true

require File.expand_path('lib/omniauth-docusign/version', __dir__)

Gem::Specification.new do |gem|
  gem.authors       = ['Jared Moody']
  gem.email         = ['jared@jetbuilt.com']
  gem.description   = 'OmniAuth strategy for DocuSign.'
  gem.summary       = 'OmniAuth strategy for DocuSign.'
  gem.homepage      = 'https://github.com/jetbuilt/omniauth-docusign'
  gem.licenses      = 'MIT'

  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.name          = 'omniauth-docusign'
  gem.require_paths = ['lib']
  gem.version       = OmniAuth::DocuSign::VERSION
  gem.required_ruby_version = '>= 2.7.0'
  gem.metadata['rubygems_mfa_required'] = 'true'

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'rake', '~> 13.0'
  gem.add_development_dependency 'rspec', '~> 3.12'
  gem.add_development_dependency 'rubocop', '~> 1.41.0'
  gem.add_development_dependency 'rubocop-performance', '~> 1.15.0'
  gem.add_development_dependency 'rubocop-rake', '~> 0.6.0'
  gem.add_development_dependency 'rubocop-rspec', '~> 2.16.0'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
