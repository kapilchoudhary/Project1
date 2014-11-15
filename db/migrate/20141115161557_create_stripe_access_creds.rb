class CreateStripeAccessCreds < ActiveRecord::Migration
  def change
    create_table :stripe_access_creds do |t|
      t.string :access_token
      t.integer :doctor_profile_id

      t.timestamps
    end
  end
end
