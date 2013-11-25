class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :hotel_id, :null => false
      t.integer :max_people
      t.string :name, :null => false

      t.timestamps
    end

    add_index :rooms, :hotel_id
  end
end