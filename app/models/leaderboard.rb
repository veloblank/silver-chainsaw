class Leaderboard < ApplicationRecord
  #scope :custom_leaders, ->(limit) {where ("best_streak desc").limit(limit)}

  def self.top_25_monthly
    User.order(best_streak: :desc ).limit(25)
  end

  def self.top_100_monthly
    User.order(best_streak: :desc ).limit(100)
  end
end
