class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :set_timezone
  layout :choose_layout
  include SessionsHelper
  helper_method :previous_board, :next_board

  def set_timezone
    Time.zone = 'Eastern Time (US & Canada)'
  end

  def previous_board
    @previous_board = Board.where('id < ?', params[:id]).last
  end

  def next_board
    @next_board = Board.where('id > ?', params[:id]).first
  end

  def require_login
    redirect_to login_path unless logged_in?
  end

  def require_admin
    redirect_to root_path unless logged_in? && is_admin?
  end

  def is_admin?
    current_user.admin
  end

  def choose_layout
    if current_user && is_admin?  #takes care of error when no user is logged in
      "admin"
    else
      "application"
    end
  end

end
