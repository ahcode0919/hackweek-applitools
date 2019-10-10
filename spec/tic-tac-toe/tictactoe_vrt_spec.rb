# frozen_string_literal: true

require_relative '../../page_objects/tic_tac_toe_page'

module IntegrationTests
  describe 'Given a user', js: true do
    let(:driver) { page.driver }

    before(:each) do |spec|
      Capybara.app_host = 'https://tic-tac-toe-kase9000.netlify.com/'
      Capybara.current_driver = :eyes

      @eyes = SeleniumDriver.eyes('Tic-Tac-Toe', spec.metadata[:full_description])
      Applitools.register_capybara_driver browser: :chrome
      @eyes.open(driver: driver)
    end

    describe 'When playing a tic-tac-toe game' do
      it 'can complete a draw game' do
        TicTacToePage.visit_page
                     .click_square(0)
                     .click_square(1)
                     .click_square(2)
                     .click_square(3)
                     .click_square(4)
                     .click_square(6)
                     .click_square(5)
                     .click_square(8)
                     .click_square(7)
        @eyes.check_window('Draw Game')
        @eyes.close
      end

      it 'can complete a winning game' do
        game_page = TicTacToePage.visit_page
        @eyes.check_window('Starting Board')

        game_page.click_square(0)
                 .click_square(3)
                 .click_square(1)
                 .click_square(4)
                 .click_square(2)
        @eyes.check_window('Winning Game')
        @eyes.close
      end
    end

    describe 'When modifying a game' do
      it 'can reorder moves and navigate move history' do
        game_page = TicTacToePage.visit_page
                                 .click_square(0)
                                 .click_square(1)
                                 .click_square(2)
                                 .click_square(3)
        @eyes.check_window('Original move history')

        game_page.sort_moves
        @eyes.check_window('Reversed move history')

        game_page.go_to_move(2)
        @eyes.check_window('Select Move')
        @eyes.close
      end
    end
  end
end
