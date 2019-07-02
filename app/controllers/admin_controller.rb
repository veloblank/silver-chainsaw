class AdminController < ApplicationController
  def score_props
    @props = Prop.needs_scoring
  end

  def change_score
    prop = Prop.find_by(:id => params[:prop][:prop])
    if prop.update(score_params)
      prop.update(:scored_by_admin => true)
      UserPick.score_away_picks(prop)
      UserPick.score_home_picks(prop)
    end
    redirect_to score_props_path
  end


  def score_params
    params.require(:prop).permit(:home_team_won, :away_team_won, :prop_id)
  end
end
