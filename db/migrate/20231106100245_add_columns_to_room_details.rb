class AddColumnsToRoomDetails < ActiveRecord::Migration[7.0]
  def change
      add_column :room_details, :available_from, :datetime
  end
end
