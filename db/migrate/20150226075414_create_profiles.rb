class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles, :id => false  do |t|

      t.integer "user_id"
      t.string "details", :limit => 100
      t.integer "privacy"

    end
    add_index("profiles", "user_id")

     end
  end

