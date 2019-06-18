class Contestant < ApplicationRecord
  has_secure_password
  has_one :pick_history
  has_many :contestant_picks
  has_many :props, through: :contestant_picks
end
