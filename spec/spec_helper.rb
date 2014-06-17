require 'rubygems'
ENV["RACK_ENV"] ||= 'test'

require 'rack/test'
require File.expand_path("../../config/environment", __FILE__)

['../factories/**/*.rb', '../support/**/*.rb'].each do |path|
  Dir[File.expand_path(path, __FILE__)].each do |f|
    require f
  end
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.mock_with :rspec
  config.expect_with :rspec

  config.before :each do
    Mongoid.purge!
  end
  config.after :all do
    Mongoid.default_session.drop
  end
end


