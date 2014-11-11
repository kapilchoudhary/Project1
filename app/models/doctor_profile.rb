class DoctorProfile < ActiveRecord::Base
  belongs_to :profile

  DEGREES = ['D', 'MDCM', 'DO', 'MBBS', 'MBChB', 'DMD', 'DDS', 'DPM', 'EdD', 'PsyD', 'PhD', 'PharmD']
  
end
