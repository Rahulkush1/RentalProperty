class CreatePgDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :pg_details do |t|
      t.string :available_for

      t.timestamps
    end
  end
end
