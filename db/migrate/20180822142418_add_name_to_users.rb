class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :type, :string
    add_column :users, :birthday, :datetime
    add_column :users, :quote, :text
  end
end
