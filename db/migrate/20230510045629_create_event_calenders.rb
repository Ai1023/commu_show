class CreateEventCalenders < ActiveRecord::Migration[6.1]
  def change
    create_table :event_calenders do |t|
      t.string :event_title, null: false
      t.text :event_body, null: false
      t.datetime :start_time, null: false
      t.datetime :finish_time, null: false
      t.integer :member, null: false

      t.timestamps
    end
  end
end
