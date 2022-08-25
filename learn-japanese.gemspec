#encoding: utf-8

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

name = "learn-japanese"
require "#{name}/version"

Gem::Specification.new name, LearnJapanese::VERSION do |s|
  s.summary     = "Learn Japanese (UNDER DEVELOPMENT)"
  s.email       = "dvarrui@protonmail.com"
  s.homepage    = LearnJapanese::HOMEPAGE
  s.authors     = ["David Vargas Ruiz"]
  s.files       = `git ls-files`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.license     = "GPL-3.0"

  s.add_runtime_dependency "colorize"
  s.add_runtime_dependency "ruby2d"
  s.add_runtime_dependency "thor"
end
