class CreateDoctorProfiles < ActiveRecord::Migration
  def change
    create_table :doctor_profiles do |t|
      t.integer :profile_id
      t.string :speciality
      t.string :gratuate_school
      t.string :degree
      t.string :professional_license
      t.datetime :year_of_completion
          
      t.timestamps
    end
  end
end
