class PropsController < ApplicationController

  def new
    @prop = Prop.new
  end

  private
  def prop_params
    params.require(:prop).permit(
      :title, :start_time, :sport, :home_team, :away_team,
      :espn_game_identifier, :home_team_won?, :away_team_won?,
      :scored_by_admin?
    )
  end
end
