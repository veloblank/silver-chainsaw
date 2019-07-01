class UserPick < ApplicationRecord
  belongs_to :users
  belongs_to :props
  accepts_nested_attributes_for :prop
end
