class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.string :name
      t.string :property_id
      t.integer :phone
      t.datetime :date
      t.datetime :time

      t.timestamps
    end
  end
end
