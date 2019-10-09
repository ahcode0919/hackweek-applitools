# frozen_string_literal: true

module IntegrationTests
  # Tic tac toe VRT game page
  class TicTacToeVRTPage < Page
    def click_square(number)
      raise 'invalid square number' if number < 1 || number > 8

      squares[number].click
    end

    def self.visit_page
      Capybara.current_session.visit('/')
      TicTacToePage.new
    end

    private

    def game_start_button
      find('.step-button', text: 'Go to game start')
    end

    def sort_moves_button
      find('.sort-button')
    end

    def squares
      page.all('.square', count: 9)
    end
  end
end
