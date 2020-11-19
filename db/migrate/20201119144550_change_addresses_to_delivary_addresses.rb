class ChangeAddressesToDelivaryAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_table :addresses, :delivary_addresses
  end
end
