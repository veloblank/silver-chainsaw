class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :previous_board, :next_board, :logged_in?, :current_user

  def previous_board
    @previous_board = Board.where('id < ?', params[:id]).last
  end

  def next_board
    @next_board = Board.where('id > ?', params[:id]).first
  end

  def logged_in?
    !!current_user
  end

  def current_user
      Contestant.find_by(id: session[:user_id])
  end
end
