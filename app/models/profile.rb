# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  city       :string(255)
#  speciality :string(255)
#  created_at :datetime
#  updated_at :datetime
#  users_id   :string(255)
#  integer    :string(255)
#  user_id    :integer
#

class Profile < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => '/images/:style/missing.png'

	validates :name, presence: true 
	validates :city, presence: true

  has_one :doctor_profile
  has_one :patient_profile
  accepts_nested_attributes_for :doctor_profile
  accepts_nested_attributes_for :patient_profile

  delegate :speciality, :gratuate_school, :degree, :professional_license,
           :year_of_completion, to: :doctor_profile, :prefix => true
  
  delegate :profile_type, to: :user, :prefix => true

  DOCTOR = 'doctor'
  PATIENT = 'patient'
  TYPES = [DOCTOR, PATIENT]

  # This method returns all doctor profiles
  def self.doctors
    self.joins(:user).where("users.profile_type = ?", DOCTOR)
  end

  # this method filters the doctors by city, state , degree and speciality
  def self.search(search)
    if search
      doctors.joins(:doctor_profile).where('city LIKE ? OR state LIKE ? OR doctor_profiles.degree LIKE ?
                   OR doctor_profiles.speciality LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
    end
  end
end
