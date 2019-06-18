class PropsController < ApplicationController

  def new
    @prop = Prop.new
  end

  def show
    @prop = Prop.find(params[:id])
  end

  def index
    if params[:board_id]
      @board = Board.find_by(id: params[:board_id])
      @props = @board.props.sort_by &:start_time
    else
      @props = Prop.todays_props
      @board = Board.find_by(id: @props.first.board_id)
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
