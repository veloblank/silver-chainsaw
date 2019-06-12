class CreateContestants < ActiveRecord::Migration[5.0]
  def change
    create_table :contestants do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :current_streak
      t.integer :best_streak

      t.timestamps
    end
  end
end
