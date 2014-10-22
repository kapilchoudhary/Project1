class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :city
      t.string :speciality

      t.timestamps
    end
  end
end
