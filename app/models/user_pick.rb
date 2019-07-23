class UserPick < ApplicationRecord
  belongs_to :user
  belongs_to :prop
  belongs_to :pick_history
  scope :is_scored?, -> {where(scored: true)}
  scope :needs_scoring?, -> {where(scored: false)}

  def self.score_pick(prop)
    # TODO: batch processing
    #slightly faster....
    UserPick.where("prop_id = ?", prop.id).find_each do |pick|
     if pick.side == "away" && prop.away_team_won
       pick.update(side_won: true, scored: true)
       pick.user.increment_streak
       pick.user.check_best_streak
     elsif pick.side == "away" && prop.home_team_won
       pick.update(side_won: false, scored: true)
       pick.user.reset_streak
     elsif pick.side == "home" && prop.home_team_won
       pick.update(side_won: true, scored: true)
       pick.user.increment_streak
       pick.user.check_best_streak
     else
       pick.update(side_won: false, scored: true)
       pick.user.reset_streak
     end
    pick.add_to_pick_history(pick)
    end

    # picks = UserPick.needs_scoring?.where("prop_id = ?", prop.id)
    # picks.each do |pick|
    #   if prop.away_team_won
    #     if pick.side == "away"
    #       pick.update(side_won: true, scored: true)
    #       pick.user.increment_streak
    #       pick.user.check_best_streak
    #     else
    #       pick.update(side_won: false, scored: true)
    #       pick.user.reset_streak
    #     end
    #   else
    #     if pick.side == "home"
    #       pick.update(side_won: true, scored: true)
    #       pick.user.increment_streak
    #       pick.user.check_best_streak
    #     else
    #       pick.update(side_won: false, scored: true)
    #       pick.user.reset_streak
    #     end
    #   end
    #   pick.add_to_pick_history(pick)
    # end
  end

  def add_to_pick_history(pick)
    if scored?
      self.user.pick_history.user_picks << pick
    end
  end
end
