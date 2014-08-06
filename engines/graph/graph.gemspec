$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "graph/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "graph"
  s.version     = Graph::VERSION
  s.authors     = ["Francesco Boffa"]
  s.email       = ["fra.boffa@gmail.com"]
  s.homepage    = "https://github.com/aomega08/the_social_network"
  s.summary     = "Facebook Graph API clone."
  s.description = "Used in the main the_social_network app to provide Graph API functionality."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.4"
  s.add_dependency "rails-api", '~> 0.2.1'

  s.add_development_dependency "sqlite3"
end
