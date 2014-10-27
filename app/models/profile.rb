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

	validates :name, presence: true 
	validates :city, presence: true
	validates :speciality, presence: true
end
