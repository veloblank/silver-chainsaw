class UserPick < ApplicationRecord
  belongs_to :user
  belongs_to :prop

  def self.score_pick(prop)
    picks = UserPick.where("prop_id = ?", prop.id)
    picks.each do |pick|
      if prop.away_team_won
        if pick.side == "away"
          pick.update(side_won: true, scored: true)
          pick.user.increment_streak
          pick.user.check_best_streak
        else
          pick.update(side_won: false, scored: true)
          pick.user.reset_streak
        end
      else
        if pick.side == "home"
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
end
