class CreatePickHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :pick_histories do |t|
      t.integer :contestant_id

      t.timestamps
    end
  end
end
