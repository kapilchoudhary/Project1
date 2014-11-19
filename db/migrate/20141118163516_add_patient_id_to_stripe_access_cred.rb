class AddPatientIdToStripeAccessCred < ActiveRecord::Migration
  def change
    add_column :stripe_access_creds, :patient_id, :integer
  end
end
