class UserPick < ApplicationRecord
  belongs_to :users
  belongs_to :props
end
