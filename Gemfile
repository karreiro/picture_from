source 'https://rubygems.org'

# Specify your gem's dependencies in picture_from.gemspec
gemspec

group :test do
  gem 'codeclimate-test-reporter', require: false
end

local_gemfile = 'Gemfile.local'

if File.exist?(local_gemfile)
  eval(File.read(local_gemfile)) # rubocop:disable Lint/Eval
end
