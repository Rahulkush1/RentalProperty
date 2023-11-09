class AddAvailableForToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :available_for, :integer
  end
end
