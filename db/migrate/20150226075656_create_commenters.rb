class CreateCommenters < ActiveRecord::Migration
  def change
    create_table :commenters, :id => false do |t|
    	t.references :post
    	t.references :user
    	t.text "comment"
    	
      t.timestamps null: false
    end
    add_index :commenters, [:user_id, :post_id]
  end
end
