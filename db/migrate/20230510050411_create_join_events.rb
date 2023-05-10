class CreateJoinEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :join_events do |t|

      t.timestamps
    end
  end
end
