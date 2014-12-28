# Requires supporting files with custom matchers and macros, etc.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

require 'rspec'
require 'fakeweb'
require 'picture_from'

RSpec.configure do |config|
  config.filter_run_excluding :online => !ENV['RUN_ONLINE_TESTS']
  config.include FakeWebHelper
end
