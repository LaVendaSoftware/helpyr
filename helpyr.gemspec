# frozen_string_literal: true

require_relative "lib/helpyr/version"

Gem::Specification.new do |spec|
  spec.name = "helpyr"
  spec.version = Helpyr::VERSION
  spec.authors = ["Lavenda Software"]
  spec.email = ["lavenda@lavenda.com.br"]

  spec.summary = "Helpyr is used to encapsulate the scope and query of models"
  spec.homepage = "https://github.com/LavendaSoftware/helpyr"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.4.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "#{spec.homepage}/blob/main/README.md"
  spec.metadata["changelog_uri"] = "#{spec.homepage}/commits/main"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
