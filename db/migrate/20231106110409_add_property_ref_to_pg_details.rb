class AddPropertyRefToPgDetails < ActiveRecord::Migration[7.0]
  def change
    add_reference :pg_details, :property, null: false, foreign_key: true
  end
end
