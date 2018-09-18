class RenameUserTypeColumn < ActiveRecord::Migration[5.1]
  def change
  	rename_column :users, :type, :adventurer_type
  end
end
