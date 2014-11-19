# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stripe_access_creds, :foreign_key => :patient_id
  has_one :profile
  accepts_nested_attributes_for :profile

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  after_create :create_user_profile

  def is_doctor?
    self.profile_type == Profile::DOCTOR
  end

  def is_admin?
    self.profile_type == Profile::ADMIN
  end

  def is_patient?
    self.profile_type == Profile::PATIENT
  end
  
  def profile_completed?
    profile.try(:doctor_profile) || profile.try(:patient_profile)
  end
  
  private

  def create_user_profile
    self.build_profile.save(:validate => false)
  end
end
