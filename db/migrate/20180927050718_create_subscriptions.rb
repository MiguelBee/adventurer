class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.integer :user_id

      t.timestamps
    end

    rename_column :votes, :post, :post_id
    remove_column :votes, :user_id
  end
end
