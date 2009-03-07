require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'redgreen'

task :default => [:test]

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end
