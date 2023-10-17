class RemoveFlatTypeFromProperties < ActiveRecord::Migration[7.0]
  def change
    remove_column :properties, :flat_type, :integer
  end
end
