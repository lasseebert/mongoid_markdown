# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mongoid_markdown/version'

Gem::Specification.new do |gem|
  gem.name          = "mongoid_markdown"
  gem.version       = MongoidMarkdown::VERSION
  gem.authors       = ["Lasse Skindstad Ebert"]
  gem.email         = ["lasseebert@gmail.com"]
  gem.description   = %q{Makes it easy to use markdown with mongoid}
  gem.summary       = %q{Makes it easy to use markdown with mongoid}
  gem.homepage      = "https://github.com/lasseebert/mongoid_markdown"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'redcarpet', '~> 2.2'
  gem.add_dependency 'mongoid'

  gem.add_development_dependency 'rspec', '~> 2.12'
  gem.add_development_dependency 'guard-rspec', '~> 2.4'
  gem.add_development_dependency 'rb-inotify', '~> 0.8.8'

end
