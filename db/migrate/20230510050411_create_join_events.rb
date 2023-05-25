class CreateJoinEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :join_events do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.timestamps
    end
  end
end
