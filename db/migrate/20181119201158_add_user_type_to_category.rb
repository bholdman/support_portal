class AddUserTypeToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :user_type, :string
  end
end