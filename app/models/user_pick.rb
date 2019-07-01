class UserPick < ApplicationRecord
  belongs_to :users, optional: true
  belongs_to :props, optional: true


  
end
