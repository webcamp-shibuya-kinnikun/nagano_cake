class CreateDelivaryAdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivary_adresses do |t|

      t.references :customer, foreign_key: true

      t.string :name, :string, null: false
      t.string :postal_code, :string, null: false
      t.string :address, :string, null: false


      t.timestamps
    end
  end
end
