# Requires supporting files with custom matchers and macros, etc.
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

require 'rspec'
require 'fakeweb'
require 'picture_from'

RSpec.configure do |config|
  config.before(:all) do
    FakeWeb.allow_net_connect = false
  end
  config.include FakeWebHelper
end
