module PropsHelper

  def make_selection(params)
    prop = Prop.find_by(id: params[:q])
    side = params[:side]
    user = current_user
    pick = UserPick.create(prop_id: prop.id, side: side, user_id: current_user.id)
  end

  def prop_locked(prop)
    if prop.locked
      "game-locked"
    end
  end

  def prop_selected(prop)
    user_pick = current_user.user_picks.last.prop_id
    if user_pick == prop.id
      "prop-pending"
    end
  end

  def opponent_away(prop)
    if prop_locked(prop)
      prop.away_team
    else
      link_to prop.away_team, add_prop_to_user_entry_path(prop, :side => "away"), method: "POST"
    end
  end

  def opponent_home(prop)
    if prop_locked(prop)
      prop.home_team
    else
      link_to prop.home_team, add_prop_to_user_entry_path(prop, :side => "home"), method: "POST"
    end
  end
end
