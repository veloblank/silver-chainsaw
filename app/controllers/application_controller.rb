class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :previous_board, :next_board

  def previous_board
    @previous_board = Board.where('id < ?', params[:id]).last
  end

  def next_board
    @next_board = Board.where('id > ?', params[:id]).first
  end
end
