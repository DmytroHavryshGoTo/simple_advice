# frozen_string_literal: true

require_relative "lib/simple_advice/version"

Gem::Specification.new do |spec|
  spec.name = "simple_advice"
  spec.version = SimpleAdvice::VERSION
  spec.authors = ["Dmytro Havrysh"]
  spec.email = ["dmytro.havrysh1@gmail.com"]

  spec.summary = "Implementation of Advice Slip JSON API"
  spec.description = "Easily get an advice"
  spec.homepage = "https://github.com/DmytroHavryshGoTo/simple_advice"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 1.7"
  spec.add_dependency "faraday_middleware", "~> 1.1"
end
