class CreateAvatars < ActiveRecord::Migration[5.1]
  def change
    create_table :avatars do |t|
    	t.integer :user_id
    	t.string :picture
      t.timestamps
    end
  end
end
