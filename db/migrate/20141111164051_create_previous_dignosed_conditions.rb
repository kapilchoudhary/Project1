class CreatePreviousDignosedConditions < ActiveRecord::Migration
  def change
    create_table :previous_dignosed_conditions do |t|
      t.integer :patient_profile_id
      t.string :name
      t.string :note 
      
      t.timestamps
    end
  end
end
