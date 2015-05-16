class CreateLikers < ActiveRecord::Migration
  def change
    create_table :likers, :id => false  do |t|
    	t.references :post
    	t.references :user

      t.timestamps null: false
    end
    add_index :likers, [:user_id, :post_id]
  end
end
