class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.integer :adventure_id
      t.integer :user_id
      t.string :title
      t.datetime :date
      t.string :picture
      t.string :caption
      t.string :video
      t.text :travel_log

      t.string :post_type
      t.timestamps
    end
    add_index :adventures, :user_id
    add_index :posts, :adventure_id
    add_index :posts, %i[user_id adventure_id]
  end
end
