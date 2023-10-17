class AddPublishToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :publish, :integer, default: 0
  end
end
