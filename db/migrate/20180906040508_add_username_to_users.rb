class AddUsernameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :about, :text
    remove_column :adventures, :duration
    add_column :adventures, :str_date, :datetime
    add_column :adventures, :end_date, :datetime
  end
end
