class AddVisitStatusToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :visit_status, :integer, default: 0
  end
end
