module BoardsHelper

  def previous_board_link
    if previous_board
      DateTime.parse(previous_board.name).strftime('%a. %b %e')
    end
  end

  def next_board_link
    if next_board
      DateTime.parse(next_board.name).strftime('%a. %b %e')
    end
  end
    
end
