class AddBoardIdToProps < ActiveRecord::Migration[5.0]
  def change
    add_column :props, :board_id, :integer
  end
end
