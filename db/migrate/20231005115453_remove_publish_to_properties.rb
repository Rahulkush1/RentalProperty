class RemovePublishToProperties < ActiveRecord::Migration[7.0]
  def change
    remove_column :properties, :publish, :integer
  end
end
