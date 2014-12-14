if ENV['TRAVIS']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

if ENV['COVERAGE']
  require 'simplecov'

  SimpleCov.start do
    add_filter '/spec/'
    add_filter '/vendor/bundle/'
  end
end
