class AddPolymorphicToReview < ActiveRecord::Migration[7.0]
  def change  
    change_table :reviews do |t|
      t.references :reviewable, polymorphic: true
    end
  end
end
