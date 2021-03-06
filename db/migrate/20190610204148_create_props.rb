class CreateProps < ActiveRecord::Migration[5.0]
  def change
    create_table :props do |t|
      t.string :title
      t.date :date
      t.datetime :start_time
      t.string :sport
      t.string :home_team
      t.string :away_team
      t.string :espn_game_identifier, default: nil
      t.boolean :locked, default: false
      t.boolean :home_team_won, default: nil
      t.boolean :away_team_won, default: nil
      t.boolean :scored_by_admin, default: false
      t.integer :board_id

      t.timestamps
    end
  end
end
