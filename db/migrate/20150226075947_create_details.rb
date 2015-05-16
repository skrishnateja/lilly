class CreateDetails < ActiveRecord::Migration
  def change
    create_table :details, :id => false do |t|
    	t.references :group
    	t.string "details", :limit => 50
    	t.integer "privacy"
      t.timestamps null: false
    end

    add_index :details, :group_id
  end
end
