class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
    t.references :item, foreign_key: true
    t.references :order, foreign_key: true
    t.integer :quantity, null: false
    t.integer :tax_in_price, null: false
    t.integer :production_status, null: false, default: 0

      t.timestamps
    end
  end
end
