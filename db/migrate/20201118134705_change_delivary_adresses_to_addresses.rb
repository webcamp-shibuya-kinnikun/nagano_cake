class ChangeDelivaryAdressesToAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_table :delivary_adresses, :address
  end
end
