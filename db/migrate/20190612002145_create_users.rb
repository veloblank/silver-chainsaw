class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :current_streak, default: 0
      t.integer :best_streak, default: 0
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
