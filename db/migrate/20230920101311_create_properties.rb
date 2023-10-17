class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    change_column :properties, :status, :integer
    change_column :properties, :prop_type, :integer
    change_column :properties, :flat_type, :integer
  end
  
end
