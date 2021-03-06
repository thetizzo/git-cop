# frozen_string_literal: true

$LOAD_PATH.append File.expand_path("lib", __dir__)
require "git/cop/identity"

Gem::Specification.new do |spec|
  spec.name = Git::Cop::Identity.name
  spec.version = Git::Cop::Identity.version
  spec.platform = Gem::Platform::RUBY
  spec.authors = ["Brooke Kuhlmann"]
  spec.email = ["brooke@alchemists.io"]
  spec.homepage = "https://github.com/bkuhlmann/git-cop"
  spec.summary = "A command line interface for linting Git commits."
  spec.license = "Apache-2.0"

  spec.metadata = {
    "source_code_uri" => "https://github.com/bkuhlmann/git-cop",
    "changelog_uri" => "https://github.com/bkuhlmann/git-cop/blob/master/CHANGES.md",
    "bug_tracker_uri" => "https://github.com/bkuhlmann/git-cop/issues"
  }

  spec.signing_key = Gem.default_key_path
  spec.cert_chain = [Gem.default_cert_path]

  spec.required_ruby_version = "~> 2.7"
  spec.add_dependency "pastel", "~> 0.7"
  spec.add_dependency "refinements", "~> 7.0"
  spec.add_dependency "runcom", "~> 6.0"
  spec.add_dependency "thor", "~> 0.20"
  spec.add_development_dependency "bundler-audit", "~> 0.6"
  spec.add_development_dependency "gemsmith", "~> 14.0"
  spec.add_development_dependency "guard-rspec", "~> 4.7"
  spec.add_development_dependency "pry", "~> 0.12"
  spec.add_development_dependency "pry-byebug", "~> 3.7"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "reek", "~> 5.6"
  spec.add_development_dependency "rspec", "~> 3.9"
  spec.add_development_dependency "rubocop", "~> 0.79"
  spec.add_development_dependency "rubocop-performance", "~> 1.5"
  spec.add_development_dependency "rubocop-rake", "~> 0.5"
  spec.add_development_dependency "rubocop-rspec", "~> 1.37"
  spec.add_development_dependency "simplecov", "~> 0.18"

  spec.files = Dir["lib/**/*"]
  spec.extra_rdoc_files = Dir["README*", "LICENSE*"]
  spec.executables << "git-cop"
  spec.require_paths = ["lib"]
end
