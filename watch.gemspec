$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "watch/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "watch"
  s.version     = Watch::VERSION
  s.authors     = ["Cosimo Barbato"]
  s.email       = ["cbarb001@gmail.com"]
  s.homepage    = "https://github.com/grantiq/watch"
  s.summary     = "An engine for providing watch/unwatch functionality."
  s.description = "An engine using React to provide a simple component for watch/unwatch that can be easily extended."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_dependency "react-rails"

  s.add_development_dependency "pg"
end
