# frozen_string_literal: true

module IntegrationTests
  # Page object base class
  class Page
    include Capybara::DSL
    include ::RSpec::Matchers
  end
end
