class CreateOrderdetails < ActiveRecord::Migration[6.1]
  def change
    create_table :orderdetails do |t|
      t.integer :item_id, null: false
      t.integer :order_id, null: false
      t.integer :quantity, null: false
      t.integer :tax_price, null: false


      t.timestamps null: false
    end
  end
end
