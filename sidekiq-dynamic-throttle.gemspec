# -*- encoding: utf-8 -*-

$:.push File.expand_path '../lib', __FILE__
require 'sidekiq-dynamic-throttle/version'

Gem::Specification.new do |s|
  s.name        = 'sidekiq-dynamic-throttle'
  s.license     = 'MIT'
  s.version     = Sidekiq::DynamicThrottle::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Bob Breznak', 'Blake Thomas', 'Enova']
  s.email       = ['bob.breznak@gmail.com', 'bwthomas@gmail.com']
  s.homepage    = 'https://github.com/bobbrez/sidekiq-dynamic-throttle'
  s.summary     = 'Worker backed throttling for job processing'
  s.description = 'Worker backed throttling for job processing'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_development_dependency 'pry'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'simplecov-rcov'

  s.add_dependency 'redis'
  s.add_dependency 'sidekiq', '>= 2.0', '< 4.0'
end
