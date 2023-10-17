class Changecolum < ActiveRecord::Migration[7.0]
  def change
    change_column :properties, :status, :integer , default: 0
  end
end
