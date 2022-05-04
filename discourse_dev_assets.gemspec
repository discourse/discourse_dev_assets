# frozen_string_literal: true

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "discourse_dev_assets/version"

Gem::Specification.new do |spec|
  spec.name          = "discourse_dev_assets"
  spec.version       = DiscourseDevAssets::VERSION
  spec.authors       = ["Vinoth Kannan"]
  spec.email         = ["svkn.87@gmail.com"]

  spec.summary       = %q{Assets for Discourse dev module}
  spec.description   = %q{Assets for Discourse dev module}
  spec.homepage      = "https://github.com/discourse/discourse_dev_assets"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/).reject { |s| s =~ /^(spec)/ }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "faker", "~> 2.16"
  spec.add_runtime_dependency "literate_randomizer"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rubocop-discourse", "~> 2.5.0"

  spec.required_ruby_version = '>= 2.6.0'
end
