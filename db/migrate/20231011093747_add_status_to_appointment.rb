class AddStatusToAppointment < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :status, :integer, default: 2
  end
end
