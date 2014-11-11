class CreatePatientProfiles < ActiveRecord::Migration
  def change
    create_table :patient_profiles do |t|
      t.integer :profile_id
      t.string :gender
      t.datetime :date_of_birth
      t.string :location

      t.timestamps
    end
  end
end
