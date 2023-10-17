class CreateRoomDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :room_details do |t|
      t.string :area
      t.string :available_for

      t.timestamps
    end
  end
end
