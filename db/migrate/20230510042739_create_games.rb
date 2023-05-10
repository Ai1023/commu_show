class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.text :game_body, null: false
      t.string :game_title, null: false

      t.timestamps
    end
  end
end
