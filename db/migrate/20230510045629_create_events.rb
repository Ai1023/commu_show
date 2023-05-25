class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :event_title, null: false
      t.text :event_body, null: false
      t.datetime :start_time, null: false
      t.datetime :finish_time, null: false
      t.references :customer, null: false, foreign_key: true
      t.timestamps
    end
  end
end
