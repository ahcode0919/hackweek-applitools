# frozen_string_literal: true

module IntegrationTests
  # Page object base class
  class Page
    include Capybara::DSL
    include ::RSpec::Matchers

    def wait(timeout = Capybara.default_max_wait_time, &block)
      count = 0
      until count > timeout || block.call
        sleep(1)
        count += 1
      end
      block.call
    end
  end
end
