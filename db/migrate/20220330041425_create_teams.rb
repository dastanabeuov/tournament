class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.boolean :best, default: false, null: false
      t.integer :tournament_id, null: false, foreign_key: true
      t.integer :user_id, null: false, foreign_key: true

      t.timestamps
    end
    add_index :teams, :user_id
    add_index :teams, :tournament_id
  end
end
