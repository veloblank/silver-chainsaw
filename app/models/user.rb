class User < ApplicationRecord
  has_secure_password
  has_one :pick_history
  has_many :user_picks
  has_many :props, through: :user_picks
  validates :email, :username, presence: true
  validates :email, :username, uniqueness: true
  validates :password, length: { minimum: 8, allow_nil: true }, confirmation: true

  def reset_streak
    self.update(current_streak: 0)
  end

  def increment_streak
    streak = current_streak + 1
    self.update(:current_streak => streak)
  end

  def check_best_streak
    if current_streak > best_streak
      self.update(:best_streak => current_streak)
    end
  end
end
