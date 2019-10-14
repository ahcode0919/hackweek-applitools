# frozen_string_literal: true

require_relative '../../page_objects/tic_tac_toe_page'

module IntegrationTests
  describe 'Given a user', js: true do
    before(:each) do
      Capybara.app_host = 'https://tic-tac-toe-kase9000.netlify.com/'
      Capybara.current_driver = :selenium_chrome
    end

    describe 'When playing a tic-tac-toe game' do
      it 'can complete a draw game' do
        game_page = TicTacToePage.visit_page
                                 .click_square(0)
                                 .click_square(1)
                                 .click_square(2)
                                 .click_square(3)
                                 .click_square(4)
                                 .click_square(6)
                                 .click_square(5)
                                 .click_square(8)
                                 .click_square(7)
        expect(game_page.draw?).to be(true)
      end

      it 'can complete a winning game' do
        game_page = TicTacToePage.visit_page
                                 .click_square(0)
                                 .click_square(3)
                                 .click_square(1)
                                 .click_square(4)
                                 .click_square(2)
        expect(game_page.winner?('X')).to be(true)
      end
    end

    describe 'When modifying a game' do
      it 'can reorder moves' do
        game_page = TicTacToePage.visit_page
                                 .click_square(0)
                                 .click_square(1)
                                 .click_square(2)
                                 .click_square(3)
        expect(game_page.moves).to eq(5)

        game_page = game_page.sort_moves
        expect(game_page.move_at_index?(0, 4)).to be(true)
      end

      it 'can navigate the history' do
        game_page = TicTacToePage.visit_page
                                 .click_square(0)
                                 .click_square(1)
                                 .click_square(2)
                                 .go_to_move(2)
        expect(game_page.move_selected?(2)).to be(true)
      end
    end

    describe 'When playing a game' do
      it 'shows correct player statuses' do
        game_page = TicTacToePage.visit_page
        expect(game_page.next_player?('X')).to be(true)

        game_page = game_page.click_square(0)
        expect(game_page.next_player?('O')).to be(true)
      end
    end
  end
end
