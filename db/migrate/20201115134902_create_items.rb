class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
     t.references :genre, foreign_key: true

     t.string :name, null: false
     t.string :image_id, null: false
     t.text :explanation, null: false
     t.integer :tax_out_price, null: false
     t.boolean :is_sale, null: false, default: "FALSE"
      t.timestamps
    end
  end
end
