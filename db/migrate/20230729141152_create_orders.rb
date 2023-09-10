class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id, null: false
      t.integer :payment, null: false, default: 0
      t.integer :carriage, null: false
      t.integer :total_amount, null: false
      t.string :address, null: false
      t.string :post_code, null: false
      t.string :home_address, null: false


      t.timestamps null: false
    end
  end
end
