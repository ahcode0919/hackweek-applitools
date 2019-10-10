# frozen_string_literal: true

require 'byebug'
require 'capybara/rspec'
require 'eyes_selenium'
require 'webdrivers'

require_relative '../helpers/selenium_config'
require_relative '../page_objects/page'

module IntegrationTests
  Dir.glob('../page_objects/**/*.rb').each(&method(:require))

  RSpec.configure do |config|
    config.include Capybara::DSL

    config.before(:suite) do
      Applitools::EyesLogger.log_handler = Logger.new(STDOUT).tap do |logger|
        logger.level = Logger::ERROR
      end
    end

    config.before(:each) do
    end

    config.after(:suite) do
      if Capybara.default_driver != :rack_test
        Capybara.current_session.driver.quit
      end
    end

    config.after(:each) do
      Capybara.current_session.driver.reset!
    end
  end
end
