class RemoveSpecialityFromProfiles < ActiveRecord::Migration
  def change
    remove_column :profiles, :speciality
  end
end
