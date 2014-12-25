#!/usr/bin/env rake
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

begin
  Bundler.setup :default, :development
  Bundler::GemHelper.install_tasks
rescue Bundler::BundlerError => error
  $stderr.puts error.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit error.status_code
end

desc 'Run RSpec with code coverage'
task :coverage do
  ENV['COVERAGE'] = 'true'
  Rake::Task['spec'].execute
end

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new(:rubocop)

desc 'Default: run tests'
task default: [:spec]

desc 'C.I: run tests and rubocop'
task :ci do
  Rake::Task['rubocop'].execute
  Rake::Task['spec'].execute
end
