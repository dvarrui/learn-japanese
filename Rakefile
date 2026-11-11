require "bundler/gem_tasks"
require "rake/testtask"

desc "Help"
task :help do
  system("rake -T")
end

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/*_test.rb"]
end

require "standard/rake"

task default: %i[test standard]
