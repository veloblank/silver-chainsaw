class ContestantPick < ApplicationRecord
  belongs_to :contestants
  belongs_to :props
end
