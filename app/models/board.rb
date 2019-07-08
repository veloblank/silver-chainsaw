class Board < ApplicationRecord
  has_many :props
  validates :date, presence: true
  validates_uniqueness_of :date, message: "This prop board has already been created."
end
