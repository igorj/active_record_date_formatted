$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "active_record_date_formatted/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "date_formatted"
  s.version     = ActiveRecordDateFormatted::VERSION
  s.authors     = ["Igor Jancev"]
  s.email       = ["igor@masterybits.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of DateFormatted."
  s.description = "TODO: Description of DateFormatted."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "gem-release"
end
