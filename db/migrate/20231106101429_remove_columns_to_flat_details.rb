class RemoveColumnsToFlatDetails < ActiveRecord::Migration[7.0]
  def change
    remove_column :flat_details, :available_for, :string
    remove_column :pg_details, :available_for, :string
    remove_column :room_details, :available_for, :string

  end
end
