class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.references :user
    	t.text "content" 
    	t.integer "privacy"
    	t.string "img", :limit => 60
    	t.string "link", :limit => 60
    	t.string "media", :limit => 60
    	t.integer "likes"
    	t.integer "comments"
    	t.string "last_comment", :limit => 60
      t.timestamps null: false
    end
    add_index :posts, :user_id
  end
end
