class StripeAccessCred < ActiveRecord::Base
  belongs_to :doctor_profile
  belongs_to :patient, :foreign_key => :patient_id, :class => User
end
