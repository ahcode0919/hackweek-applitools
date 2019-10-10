# frozen_string_literal: true

module IntegrationTests
  describe 'Given a User', js: true do
    let(:driver) { page.driver }

    before(:each) do |spec|
      Capybara.app_host = 'https://applitools.com'
      @eyes = SeleniumDriver.eyes('Hello World', spec.metadata[:full_description])
      Applitools.register_capybara_driver browser: :chrome
      @eyes.open(driver: driver)
    end

    describe 'When navigating to the homepage' do
      it 'should render hello world page' do
        visit('/helloworld')
        @eyes.check_window('Hello World!')

        click_button('Click me!')
        @eyes.check_window('Click!')
        @eyes.close
      end
    end
  end
end
