class AddMoreColumnToUser < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      add_index :users, :confirmation_token,   unique: true
    end
  end
end
