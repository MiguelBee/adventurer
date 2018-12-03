class AddTableAvatars < ActiveRecord::Migration[5.1]
  def change
    create_table :avatars do |t|
      t.string :picture
      t.timestamps
    end
  end
end
