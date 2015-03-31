$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "watch/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "watch"
  s.version     = Watch::VERSION
  s.authors     = ["Cosimo Barbato"]
  s.email       = ["cbarb001@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Watch."
  s.description = "TODO: Description of Watch."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.1"
  s.add_dependency 'json-bloomfilter'

  s.add_development_dependency "pg"

  s.add_development_dependency "thor"  
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-minitest"
  s.add_development_dependency "wrong"
  s.add_development_dependency "fabrication"
  s.add_development_dependency "faker"
  s.add_development_dependency "minitest-rails"
  s.add_development_dependency "minitest-reporters"
  
  
  
  
end
