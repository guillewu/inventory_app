class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.integer :room_id, :null => false
      t.date :start_date, :null => false
      t.date :end_date, :null => false
      t.float :disc_rate, :null => false
      t.integer :los, :null => false, :default => 1
      t.timestamps
    end

    add_index :discounts, :room_id
  end
end
