class CreateContestantPicks < ActiveRecord::Migration[5.0]
  def change
    create_table :contestant_picks do |t|
      t.integer :contestant_id
      t.integer :prop_id

      t.timestamps
    end
  end
end
