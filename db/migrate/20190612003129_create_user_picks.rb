class CreateUserPicks < ActiveRecord::Migration[5.0]
  def change
    create_table :user_picks do |t|
      t.integer :user_id
      t.integer :prop_id

      t.timestamps
    end
  end
end
