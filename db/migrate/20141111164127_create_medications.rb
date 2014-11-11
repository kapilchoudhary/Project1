class CreateMedications < ActiveRecord::Migration
  def change
    create_table :medications do |t|
      t.integer :patient_profile_id
      t.string :name
      t.string :note

      t.timestamps
    end
  end
end
