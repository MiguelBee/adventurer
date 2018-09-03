class DropTableGravatars < ActiveRecord::Migration[5.1]
  def change
  	drop_table :gravatars
  end
end
