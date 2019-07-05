class AdminController < ApplicationController
  def score_props
    @props = Prop.needs_scoring
  end

  def change_score
    prop = Prop.find(params[:prop][:prop])
    fill_out_score_params(params)
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

  def fill_out_score_params(params)
    if params[:prop][:home_team_won]
      params[:prop][:away_team_won] = false
    else
      params[:prop][:home_team_won] = false
    end
  end
end
