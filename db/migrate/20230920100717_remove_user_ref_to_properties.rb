class RemoveUserRefToProperties < ActiveRecord::Migration[7.0]
  def change
    remove_reference :properties, :user, null: false, foreign_key: true
  end
end
