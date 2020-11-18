class RenamePhoneNuberColummToCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :phone_nuber, :phone_number
  end
end
