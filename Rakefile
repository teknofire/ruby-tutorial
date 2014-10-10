task :default => :test

desc "Run tests"
task :test do
  exec('ruby -I. person_test.rb')
end

desc "Run test example code"
task :test_example do
  exec('ruby -Iexample person_test.rb')
end