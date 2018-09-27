class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
    	t.integer :user_id
    	t.integer :adventure_id
    	t.integer :post

      t.timestamps
    end

  end
end
