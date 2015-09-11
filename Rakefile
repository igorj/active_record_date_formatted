require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

desc "Bump the patch version, tag and release gem"
task :release_patch do
  system "gem bump --version patch --tag --release"
end

desc "Bump the minor version, tag and release gem"
task :release_patch do
  system "gem bump --version minor --tag --release"
end

desc "Bump the major version, tag and release gem"
task :release_patch do
  system "gem bump --version major --tag --release"
end

task default: :test
