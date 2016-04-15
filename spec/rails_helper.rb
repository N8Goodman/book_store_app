# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.include FactoryGirl::Syntax::Methods
  config.include Helpers
end

VCR.configure do |config|
  config.allow_http_connections_when_no_cassette = true
  config.cassette_library_dir = 'spec/vcr_cassettes'
  config.hook_into :webmock
  config.ignore_localhost = true
  config.configure_rspec_metadata!
  config.debug_logger = File.open("#{Rails.root}/log/vcr.log", "w")
  config.default_cassette_options = { record: :new_episodes }
  config.filter_sensitive_data('<TWITTER_API_KEY>') do
    ENV['TWITTER_API_KEY']
  end
  config.filter_sensitive_data('<TWITTER_ACCESS_TOKEN>') do
    ENV['TWITTER_ACCESS_TOKEN']
  end
end
