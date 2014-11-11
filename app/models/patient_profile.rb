class PatientProfile < ActiveRecord::Base
  belongs_to :profile
  has_one :allergy
  has_one :previous_dignosed_condition
  has_one :medication

  accepts_nested_attributes_for :allergy
  accepts_nested_attributes_for :medication
  accepts_nested_attributes_for :previous_dignosed_condition
end
