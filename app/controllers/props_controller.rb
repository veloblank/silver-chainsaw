class PropsController < ApplicationController
  before_action :require_login, only: [:new]

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

    def require_login
      redirect_to login_path unless logged_in?
    end
end
