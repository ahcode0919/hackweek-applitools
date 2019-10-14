# frozen_string_literal: true

require 'capybara'
require 'rspec'

module IntegrationTests
  # Page object base class
  class Page
    include Capybara::DSL
    include ::RSpec::Matchers
  end
end
