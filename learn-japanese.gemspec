require_relative "lib/learn-japanese/version"

Gem::Specification.new do |s|
  s.name = LearnJapanese::NAME
  s.version = LearnJapanese::VERSION
  s.license = "AGPL-3.0"
  s.authors = ["David Vargas Ruiz"]
  s.email = "dvarrui@proton.me"

  s.homepage = LearnJapanese::HOMEPAGE
  s.summary = "Learn Japanese (UNDER DEVELOPMENT)"
  s.description = "Learn Japanese (UNDER DEVELOPMENT)"

  # s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  # s.files       = `git ls-files`.split("\n")
  s.extra_rdoc_files = ["README.md", "LICENSE"] + Dir.glob(File.join("docs", "**", "*.md"))
  s.executables << "learn-japanese"
  s.files = Dir.glob(File.join("lib", "**", "*.*"))

  s.required_ruby_version = ">= 3.3.10"
  s.add_runtime_dependency "colorize", "~> 1.1"
  s.add_runtime_dependency "ruby2d", "~> 0.12"
  s.add_runtime_dependency "thor", "~> 1.5"

  s.add_development_dependency "standard", "~> 1.57"
end
