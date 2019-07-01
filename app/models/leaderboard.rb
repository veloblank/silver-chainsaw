class Leaderboard < ApplicationRecord

  def self.top_ten_monthly
    User.order(best_streak: :desc ).limit(10)
  end
end
