class AddPickHistoryIdToUserPicks < ActiveRecord::Migration[5.0]
  def change
    add_column :user_picks, :pick_history_id, :integer, default: nil
  end
end
