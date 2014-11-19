class AddPaidToStripeAccessCreds < ActiveRecord::Migration
  def change
    add_column :stripe_access_creds, :paid, :boolean, :default => false
  end
end
