require_relative 'lib/audible_cli/version'

Gem::Specification.new do |spec|
  spec.name          = "audible_cli"
  spec.version       = AudibleCli::VERSION
  spec.authors       = ["Vent2"]
  spec.email         = ["ventura.c.gerald@gmail.com"]

  spec.summary       = %q{Audible Scraper.}
  spec.description   = %q{Audible Scraper.}
  spec.homepage      = "https://github.com/Vent2"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Vent2/Audible_CLI"
  spec.metadata["changelog_uri"] = "https://github.com/Vent2/Audible_CLI/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.1.4"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  # spec.add_development_dependency "nokogiri", "~> 1.10", ">= 1.10.9"
  spec.add_development_dependency "pry", "~> 0.13.1"

  spec.add_dependence "nokogiri"
end
