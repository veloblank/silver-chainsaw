class UserPick < ApplicationRecord
  belongs_to :user
  belongs_to :prop

  def self.score_away_picks(prop)
    picks = UserPick.where("prop_id = ? AND side = ?", prop.id, "away")
    picks.each do |pick|
      if prop.away_team_won
        pick.update(side_won: true, scored: true)
        pick.user.increment_streak
        pick.user.check_best_streak
      else
        pick.update(side_won: false, scored: true)
        pick.user.reset_streak
      end
    end
  end

  def self.score_home_picks(prop)
    picks = UserPick.where("prop_id = ? AND side = ?", prop.id, "home")
    picks.each do |pick|
      if prop.home_team_won
        pick.update(side_won: true, scored: true)
        pick.user.increment_streak
        pick.user.check_best_streak
      else
        pick.update(side_won: false, scored: true)
        pick.user.reset_streak
      end
    end
  end



end
