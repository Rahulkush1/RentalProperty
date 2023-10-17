class RemoveFlatTypeFromFlatDetails < ActiveRecord::Migration[7.0]
  def change
    remove_column :flat_details, :flat_type, :string
  end
end
