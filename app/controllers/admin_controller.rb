class AdminController < ApplicationController
  before_action :require_admin

  def score_props
    @props = Prop.needs_scoring?
  end

  def most_active_users
    @users = User.joins(:user_picks).group("user_picks.user_id").order("count(user_picks.user_id) desc").limit(5)
  end

  def change_score
    prop = Prop.find(params[:prop][:prop_id])
    if prop.update(score_params)
      prop.admin_score
      UserPick.score_pick(prop)
    end
    redirect_to score_props_path
  end

  def score_params
    params.require(:prop).permit(:home_team_won, :away_team_won)
  end
end
