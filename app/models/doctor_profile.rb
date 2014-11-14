class DoctorProfile < ActiveRecord::Base

  belongs_to :profile

  DEGREES = ['M.D.', 'D.O.', 'M.D', 'M.D. PhD']
  SPECIALITY = ['Dentistry', 'Dentistry - Cosmetic', 'Dentistry - Endodontics', 
                'Dentistry - Orthodontics', 'Dentistry - Pediatric', 'Dentistry - Periodontics', 
                'Dentistry - Prosthodontics', 'Ophthalmology - Retinal Surgery', 'Orthopedic Surgery',
                'Orthopedic Surgery - Foot & Ankle', 'Orthopedic Surgery - Pediatric', 
                'Orthopedic Surgery - Reconstruction', 'Orthopedic Surgery - Spine', 
				'Surgery', 'Surgery - Colorectal', 'Surgery - Hand Surgery', 'Surgery - Head & Neck', 
				'Surgery - Oncology', 'Surgery - Oral & Maxillofacial', 'Surgery - Pediatric', 'Surgery - Plastics', 
				'Surgery - Thoracic', 'Surgery - Transplant', 'Surgery - Trauma', 'Surgery - Vascular' 
				]


  validates :speciality, presence: true
  validates :degree, presence: true
  validates :professional_license, presence: true
  validates :year_of_completion, presence: true
  
end
