class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members, :id => false do |t|
  		t.references :group
      t.references :user

      t.timestamps
    end

    add_index :members, [:group_id, :user_id], unique: true
  end
end
