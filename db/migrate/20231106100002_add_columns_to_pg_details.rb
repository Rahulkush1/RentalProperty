class AddColumnsToPgDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :pg_details, :sharing_type, :integer
    add_column :pg_details, :food_facility, :boolean
  end
end
