# frozen_string_literal: true

module IntegrationTests
  # Tic tac toe game page
  class TicTacToePage < Page
    def visible?
      header.is_visible?
    end

    def click_square(number)
      raise 'Invalid square number' if number.negative? || number > 8

      squares[number].click
      TicTacToePage.new
    end

    def draw?
      has_css?('.card-body', text: 'Draw!!!')
    end

    def go_to_game_start
      game_start_button.click
      TicTacToePage.new
    end

    def go_to_move(number)
      raise 'Invalid move number' if moves < number

      step_buttons.select { |el| el.text == "Go to move ##{number}" }.first.click
      TicTacToePage.new
    end

    def move_at_index?(index, number)
      step_buttons[index].text.include?(number.to_s)
    end

    def move_selected?(number)
      has_css?('b', text: "Go to move ##{number}")
    end

    def moves
      step_buttons.count
    end

    def next_player?(char)
      status_card.text.include?(char)
    end

    def sort_moves
      sort_moves_button.click
      TicTacToePage.new
    end

    def winner?(char)
      status_card.text.include?(char) && status_card.text.include?('Winner')
    end

    def self.visit_page
      Capybara.current_session.visit('/')
      sleep(1)
      TicTacToePage.new
    end

    private

    def game_start_button
      find('.step-button', text: 'Go to game start')
    end

    def header
      find('.navbar-brand', text: 'Tic-Tac-Toe')
    end

    def sort_moves_button
      find('.sort-button')
    end

    def squares
      page.all('.square', count: 9)
    end

    def status_card
      find('.card-body')
    end

    def step_buttons
      page.all('.step-button')
    end
  end
end
