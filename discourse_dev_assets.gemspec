# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) if !$LOAD_PATH.include?(lib)
require "discourse_dev_assets/version"

Gem::Specification.new do |spec|
  spec.name = "discourse_dev_assets"
  spec.version = DiscourseDevAssets::VERSION
  spec.authors = ["Vinoth Kannan"]
  spec.email = ["svkn.87@gmail.com"]

  spec.summary = "Assets for Discourse dev module"
  spec.description = "Assets for Discourse dev module"
  spec.homepage = "https://github.com/discourse/discourse_dev_assets"
  spec.license = "MIT"

  spec.files = `git ls-files`.split($/).reject { |s| s =~ /^(spec)/ }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faker", "~> 3.5.1"
  spec.add_runtime_dependency "literate_randomizer"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rubocop-discourse"
  spec.add_development_dependency "syntax_tree"

  spec.required_ruby_version = ">= 3.3.0"
end
