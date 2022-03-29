class CreateTournaments < ActiveRecord::Migration[7.0]
  def change
    create_table :tournaments do |t|
      t.string :name, null: false
      t.date :date
      t.integer :user_id, null: false, foreign_key: true

      t.timestamps
    end
    add_index :tournaments, :user_id
  end
end
