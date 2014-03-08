$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "global_settings/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "global_settings"
  s.version     = GlobalSettings::VERSION
  s.authors     = ["Sergio Romano"]
  s.email       = ["sromano"]
  s.homepage    = "https://github.com/sromano/global_settings"
  s.summary     = "Exercise for S&D"
  s.description = "Global Settings with ActiveRecord persistance and cache"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.3"

  s.add_development_dependency "sqlite3"
end
