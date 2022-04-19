# frozen_string_literal: true

require_relative "lib/periodico/version"

Gem::Specification.new do |spec|
  spec.name = "periodico"
  spec.version = Periodico::VERSION
  spec.authors = ["Alan Ridlehoover", "Fito von Zastrow"]
  spec.email = ["periodico@firsttry.software"]

  spec.summary = "A lightweight pub/sub framework"
  spec.description = "Periodico is a lightweight pub/sub framework that leverages self-registration and dependency injection to communicate events to subscribers."
  spec.homepage = "https://firsttry.software"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/first-try-software/periodico"
  spec.metadata["changelog_uri"] = "https://github.com/first-try-software/periodico/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor|assets)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "manufacturable", "~> 2.1"
  spec.add_dependency "concurrent-ruby", "~> 1.1"
end
