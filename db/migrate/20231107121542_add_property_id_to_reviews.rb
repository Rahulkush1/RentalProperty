class AddPropertyIdToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :property_id, :integer
  end
end
