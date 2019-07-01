class AddSideToUserPicks < ActiveRecord::Migration[5.0]
  def change
    add_column :user_picks, :side, :string
  end
end
