class ChangeAddressToAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_table :address, :addresses
  end
end
