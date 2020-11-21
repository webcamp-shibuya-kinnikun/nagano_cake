class DelivaryAddressesToAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_table  :delivary_addresses,:addresses
  end
end
