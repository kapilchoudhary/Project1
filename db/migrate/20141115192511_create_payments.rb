class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :stripe_card_token
      
      t.timestamps
    end
  end
end
