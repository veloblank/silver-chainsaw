class PropsController < ApplicationController
  before_action :require_login, only: [:new]
  before_action :require_admin, only: [:new, :create]
  layout :choose_layout
  include PropsHelper

  def new
    @prop = Prop.new
  end

  def show
    @prop = Prop.find(params[:id])
  end

  def create
    @prop = Prop.new(prop_params)
    @prop.board_id = Board.find_by(name: params[:prop][:board]).id
    if @prop.valid?
      @prop.save
      redirect_to prop_path(@prop)
    else
      render :new
    end
  end

  def add_prop_to_user_entry
    redirect_to login_path(:side => pick_params[:side], :date => pick_params[:date]) if !logged_in?
    make_selection(pick_params)
    redirect_to root_path
  end

  def index
    if params[:board_id]
      @board = Board.find_by(id: params[:board_id])
      @props = Prop.filter_and_sort_by_date(@board.name.to_date)
    else
      @props = Prop.todays_sorted_props
      @board = Board.find_by(id: @props.first.board_id)
      if @props.empty?
        redirect_to new_board_path
      end
    end
  end

  private

  def prop_params
    params.require(:prop).permit(
      :title, :start_time, :sport, :date, :home_team, :away_team,
      :espn_game_identifier, :board_id, :home_team_won, :away_team_won,
      :scored_by_admin
    )
  end

  def pick_params
    params.permit(:q, :side)
  end

  def require_login
    redirect_to login_path unless logged_in?
  end

  def require_admin
    redirect_to root_path unless current_user.admin
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
