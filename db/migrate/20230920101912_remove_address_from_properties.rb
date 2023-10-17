class RemoveAddressFromProperties < ActiveRecord::Migration[7.0]
  def change
    remove_column :properties, :address, :string
  end
end
