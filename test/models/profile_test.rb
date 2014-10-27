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

require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
