class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer  :user_id, null: false, foreign_key: true
      t.integer  :tournament_id, null: false, foreign_key: true
      t.boolean  :group, default: false
      t.integer  :team_one_id
      t.integer  :team_two_id
      t.datetime :datetime
      t.integer  :goals_one
      t.integer  :goals_two
      t.integer  :winner_id

      t.timestamps
    end
  end
end
