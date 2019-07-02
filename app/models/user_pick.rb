class UserPick < ApplicationRecord
  belongs_to :users, optional: true
  belongs_to :props, optional: true

  def self.score_away_picks(prop)
    picks = UserPick.where("prop_id = ? AND side = ?", prop.id, "away")
    picks.each do |pick|
      if prop.away_team_won
        pick.update(side_won: true, scored: true)
      else
        pick.update(side_won: false, scored: true)
      end
    end
  end

  def self.score_home_picks(prop)
    picks = UserPick.where("prop_id = ? AND side = ?", prop.id, "home")
    picks.each do |pick|
      if prop.home_team_won
        pick.update(side_won: true, scored: true)
      else
        pick.update(side_won: false, scored: true)
      end
    end
  end
end
