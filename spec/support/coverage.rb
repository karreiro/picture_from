if ENV['TRAVIS'] || ENV['COVERAGE']
  require 'simplecov'

  if ENV['TRAVIS']
    require "codeclimate-test-reporter"
    SimpleCov = CodeClimate::TestReporter
  end

  SimpleCov.start do
    add_filter '/spec/'
    add_filter '/vendor/bundle/'
  end
end
