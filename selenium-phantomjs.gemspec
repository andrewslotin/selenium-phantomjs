# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'selenium/phantomjs/version'

Gem::Specification.new do |spec|
  spec.name          = "selenium-phantomjs"
  spec.version       = Selenium::Phantomjs::VERSION
  spec.authors       = ["Andrew Slotin"]
  spec.email         = ["andrew.slotin@gmail.com"]
  spec.summary       = %q{Running specs with Capybara, Selenium and PhantomJS}
  spec.description   = %q{This gem provides integration between selenium-webdriver and phantomjs via ghostdriver}
  spec.homepage      = "http://github.com/andrewslotin"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_runtime_dependency "selenium-webdriver"
end
