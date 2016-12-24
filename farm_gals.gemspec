$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "farm_gals/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "farm_gals"
  s.version     = FarmGals::VERSION
  s.authors     = ["Jesse Farmer"]
  s.email       = ["jesse@anysoft.us"]
  s.homepage    = "http://anysoft.us"
  s.summary     = "Gallery model"
  s.description = "Sortable gallery"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "carrierwave"
  s.add_dependency "mini_magick"
  s.add_dependency "fog"

  # s.add_dependency 'aws-sdk', '~> 2'

  s.add_development_dependency "rails", "~> 4.2.3"
  s.add_development_dependency "sqlite3"

  s.test_files = Dir["spec/**/*"]
end
