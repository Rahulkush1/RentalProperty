class AddConatctNoToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :contact_no, :string
  end
end
