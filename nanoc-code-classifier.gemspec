# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "nanoc/filters/code_classifier/version"

Gem::Specification.new do |s|
  s.name        = "nanoc-code-classifier"
  s.version     = Nanoc::Filters::CodeClassifier::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author      = "Josh Bassett"
  s.email       = "josh.bassett@gmail.com"
  s.homepage    = "http://joshbassett.info/"
  s.summary     = %(A nanoc filter which pre-processes a code block for special tags.)
  s.description = %(By using special tags the code classifier filter can pre-process you code blocks and apply classes to the generated HTML.)

  s.files        = Dir.glob("lib/**/*.rb") + %w(LICENSE README.md)
  s.require_path = "lib"

  s.add_dependency 'nokogiri', '~> 1.0'
  s.add_dependency 'nanoc'
end
