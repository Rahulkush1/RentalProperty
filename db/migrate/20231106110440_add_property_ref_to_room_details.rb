class AddPropertyRefToRoomDetails < ActiveRecord::Migration[7.0]
  def change
    add_reference :room_details, :property, null: false, foreign_key: true
  end
end
