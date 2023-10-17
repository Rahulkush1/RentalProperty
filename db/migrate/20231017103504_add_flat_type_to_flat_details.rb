class AddFlatTypeToFlatDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :flat_details, :flat_type, :integer
  end
end
