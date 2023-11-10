class AddAvailableFromToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :available_from, :datetime
  end
end
