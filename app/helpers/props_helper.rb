module PropsHelper

  def make_selection(params)
    prop = Prop.find_by(id: params[:q])
    side = params[:side]
    user = current_user
    pick = UserPick.create(prop_id: prop.id, side: side, user_id: current_user.id)
  end

  def prop_locked(prop)
    if prop.locked
      "prop-locked"
    end
  end

  def prop_selected(prop)
    if logged_in? && user_selection && user_selection.prop_id == prop.id
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

  def selected_away_side(prop)
    if logged_in? && user_selection && user_selection.prop_id == prop.id
      "selected" unless user_selection.side == "home"
    end
  end

  def selected_home_side(prop)
    if logged_in? && user_selection && user_selection.prop_id == prop.id
      "selected" unless user_selection.side == "away"
    end
  end

  def user_selection
    current_user.user_picks.last if logged_in?
  end
end
