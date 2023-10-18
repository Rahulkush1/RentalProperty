class RemoveColFromProperties < ActiveRecord::Migration[7.0]
  def change
    remove_column :properties, :flat_details_id, :integer
  end
end
