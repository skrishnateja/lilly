class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
		t.string "name", :limit => 50
    	t.references :user
    	t.boolean "secret"

      t.timestamps null: false
    end

    add_index :groups, :user_id
    end
end
