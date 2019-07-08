class PropsController < ApplicationController
  before_action :require_login, only: [:new, :add_prop_to_user_entry]
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
    board = Board.find_by(name: params[:prop][:board]) || Board.new
    @prop = board.props.new(prop_params) #use belongs_to/has_many association
    if @prop.valid?
      @prop.save
      redirect_to prop_path(@prop)
    else
      render :new
    end
  end

  def add_prop_to_user_entry
    if user_selection && user_selection.prop.lock_prop? #must have this conditional to check if a prop is locked if the browser is not refreshed (which locks props)
      flash[:danger] = "You cannot make a new pick. Your last pick is still pending."
      redirect_to root_path
    else
      make_selection(pick_params)
      redirect_to root_path
    end
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
    params.permit(:q, :side, :pick_history_id)
  end

end
