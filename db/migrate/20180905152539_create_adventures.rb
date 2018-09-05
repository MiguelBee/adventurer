class CreateAdventures < ActiveRecord::Migration[5.1]
  def change
    create_table :adventures do |t|
    	t.string :title
    	t.text :description
    	t.daterange :duration
    	t.integer :user_id

      t.timestamps
    end
  end
end
