class CreateAllergies < ActiveRecord::Migration
  def change
    create_table :allergies do |t|
      t.integer :patient_profile_id
      t.string :name
      t.string :note
      
      t.timestamps
    end
  end
end
