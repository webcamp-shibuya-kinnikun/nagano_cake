class RemoveStringFromAddress < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :string, :string
  end
end
