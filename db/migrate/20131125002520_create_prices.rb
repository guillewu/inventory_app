class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.integer :room_id, :null => false
      t.integer :qty, :null => false
      t.float :price, :null => false
      t.date :start_date, :null => false
      t.date :end_date, :null => false
      t.timestamps
    end

    add_index :prices, :room_id
  end
end
