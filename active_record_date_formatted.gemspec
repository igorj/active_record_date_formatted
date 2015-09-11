$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "active_record_date_formatted/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "active_record_date_formatted"
  s.version     = ActiveRecordDateFormatted::VERSION
  s.authors     = ["Igor Jancev"]
  s.email       = ["igor@masterybits.com"]
  s.homepage    = "https://github.com/igorj/active_record_date_formatted"
  s.summary     = "Adds *_formatted and *_formatted= methods to all rails model's date attributes"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "gem-release"
end
