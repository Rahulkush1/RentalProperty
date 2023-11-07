class RemoveColumnsFromTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :pg_details, :available_from, :datetime
    remove_column :room_details, :available_from, :datetime

  end
end
