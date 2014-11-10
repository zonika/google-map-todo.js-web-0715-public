ENV["SINATRA_ENV"] = "test"

require_relative '../config/environment'

require 'rack/test'
require 'capybara/rspec'
require 'capybara/dsl'
require 'capybara-webkit'
require 'selenium-webdriver'

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Capybara::DSL
end

RSpec::Matchers.define :match_exactly do |expected_match_count, selector|
  match do |context|
    matching = context.all(selector)
    @matched = matching.size
    @matched == expected_match_count
  end
  failure_message do
    "expected '#{selector}' to match exactly #{expected_match_count} elements, but matched #{@matched}"
  end
  failure_message_when_negated do
    "expected '#{selector}' to NOT match exactly #{expected_match_count} elements, but it did"
  end
end

def app
  Rack::Builder.parse_file('config.ru').first
end

# def get_driver
#   profile = Selenium::WebDriver::Firefox::Profile.new
#   profile['location.lat'] = 40.7046308
#   profile['location.lng'] = -74.01313139999999
#   profile['status'] = "OK"
#   profile['accuracy'] = 10.0
#   Selenium::WebDriver.for :firefox, :profile => profile
# end

Capybara.default_driver = :selenium
Capybara.app = app
