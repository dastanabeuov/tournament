class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.integer  :user_id, null: false, foreign_key: true
      t.integer  :tournament_id, null: false, foreign_key: true
      t.integer  :team_one_id, null: false, foreign_key: true
      t.integer  :team_two_id, null: false, foreign_key: true
      t.datetime :datetime
      t.integer  :tour
      t.string   :winner
      t.integer  :goals_one
      t.integer  :goals_two

      t.timestamps
    end
  end
end
