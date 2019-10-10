# frozen_string_literal: true

require 'dotenv'
require 'eyes_capybara'

Dotenv.load

# Selenium Driver Helper
class SeleniumDriver
  def self.eyes(app_name, test_name)
    eyes = Applitools::Selenium::Eyes.new
    eyes.config = selenium_configuration(app_name, test_name)
    eyes
  end

  def self.selenium_configuration(app_name, test_name)
    Applitools::Selenium::Configuration.new.tap do |conf|
      conf.api_key = ENV['APPLITOOLS_API_KEY']
      conf.app_name = app_name
      conf.test_name = test_name
      conf.viewport_size = Applitools::RectangleSize.new(800, 600)
    end
  end
end
