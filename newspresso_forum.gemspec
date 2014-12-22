$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "newspresso_forum/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "newspresso_forum"
  s.version     = NewspressoForum::VERSION
  s.license     = "MIT"
  s.authors     = ['Chris DiMartino', 'Monji Dolan']
  s.summary     = "Forum engine for Newspresso"
  
  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.4"

  s.add_dependency 'acts-as-taggable-on', '~> 3.4.2'
  s.add_dependency 'friendly_id'
  s.add_dependency 'kaminari'
  s.add_dependency 'merit'

  s.add_development_dependency "sqlite3"
end
