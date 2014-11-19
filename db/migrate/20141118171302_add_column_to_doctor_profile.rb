class AddColumnToDoctorProfile < ActiveRecord::Migration
  def change
  	add_column :doctor_profiles, :status,  :boolean, :default => false
  end
end
