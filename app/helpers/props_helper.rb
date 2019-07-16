module PropsHelper

  def make_selection(params)
    prop = Prop.find(params[:prop_id])
    pick_history = current_user.pick_history
    selection = current_user.user_picks.create(pick_params)
    selection.pick_history = pick_history
    selection.save
  end

  def class_prop_locked(prop)
    prop.lock_prop?
    if prop.locked
      'prop-locked'
    end
  end

  def class_prop_scored(prop)
    if prop.scored_by_admin
      'prop-scored'
    end
  end

  def class_prop_selected(prop)
    if logged_in? && user_selection && user_selection.prop_id == prop.id
      'prop-pending'
    end
  end

  def class_user_won(prop)
    if logged_in? && current_user.user_picks.any?{|pick| pick.prop_id == prop.id && pick.side_won == true}
      'prop-win'
    end
  end

  def class_user_lost(prop)
    if logged_in? && current_user.user_picks.any?{|pick| pick.prop_id == prop.id && pick.side_won == false}
      'prop-loss'
    end

  end

  def month_day(prop)
    prop.date.strftime('%b %e')
  end

  def opponent_away(prop)
    if prop.locked
      prop.away_team
    else
      link_to prop.away_team, add_prop_to_user_entry_path(prop, :side => "away"), method: "POST"
    end
  end

  def opponent_home(prop)
    if prop.locked
      prop.home_team
    else
      link_to prop.home_team, add_prop_to_user_entry_path(prop, :side => "home"), method: "POST"
    end
  end

  def selected_away_side(prop)
    if user_selection && user_selection.prop_id == prop.id
      "selected" unless user_selection.side == "home"
    end
  end

  def selected_home_side(prop)
    if user_selection && user_selection.prop_id == prop.id
      "selected" unless user_selection.side == "away"
    end
  end

  def user_selection
    current_user.user_picks.last if logged_in?
  end

  def lock_and_unlock
    prop = Prop.find(user_selection.prop_id)
    if prop.locked && !prop.scored_by_admin
      user_selection.update(locked: true)
    else
      user_selection.update(locked: false)
    end
  end
end
