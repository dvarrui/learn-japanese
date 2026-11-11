Rake::TestTask.new(:test) do |t|
  t.description = "Run tests"
  t.libs << "test"
  t.test_files = FileList["test/**/*_test.rb"]
end
