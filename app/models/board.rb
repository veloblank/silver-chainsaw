class Board < ApplicationRecord
  has_many :props
  validates :date, presence: true
  validates :date, uniqueness: true
end
