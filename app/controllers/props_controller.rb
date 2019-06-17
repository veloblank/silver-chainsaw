class PropsController < ApplicationController

  def new
    @prop = Prop.new
  end

  def show
    @prop = Prop.find(params[:id])
  end

  def index
    if params[:board_id]
      board = Board.find_by(params[:board_id])
      @props = board.props.sort_by &:start_time
    else
      @props = Prop.needs_scoring
    end
  end

  private
  def prop_params
    params.require(:prop).permit(
      :title, :start_time, :sport, :home_team, :away_team,
      :espn_game_identifier, :home_team_won, :away_team_won,
      :scored_by_admin
    )
  end
end
