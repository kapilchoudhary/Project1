class AddUsersIdToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :users_id, :string
    add_column :profiles, :integer, :string
    add_index :profiles, :integer
  end
end
