ENV["SINATRA_ENV"] = "test"

require_relative '../config/environment'

require 'json'
require 'rack/test'
require 'capybara/rspec'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'capybara-webkit'
require 'selenium-webdriver'

RSpec.configure do |config|
  config.include Rack::Test::Methods
  config.include Capybara::DSL
end

def app
  Rack::Builder.parse_file('config.ru').first
end

Capybara.register_driver :dev_selenium do |app|
  profile = Selenium::WebDriver::Firefox::ProfilesIni.new["dev"]
  Capybara::Selenium::Driver.new( app, :browser => :firefox, :profile => profile ) 
end

Capybara.default_driver = :dev_selenium

Capybara.app = app
