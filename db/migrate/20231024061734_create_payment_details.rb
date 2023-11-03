class CreatePaymentDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_details do |t|
      t.string :payment_id
      t.integer :user_id
      t.integer :property_id
      t.boolean :payment_status, default: false
      t.integer :total_amount

      t.timestamps
    end
  end
end
