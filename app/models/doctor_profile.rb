class DoctorProfile < ActiveRecord::Base
  belongs_to :profile

  DEGREES = ['MD', 'MDCM', 'DO', 'MBBS', 'MBChB', 'DMD', 'DDS', 'DPM', 'EdD', 'PsyD', 'PhD', 'PhD']
  SPECIALITY = ['Addiction Medicine', 'ADHD and Autism', 'Aesthetic Medicine', 'Anesthesiology',
                'Anti-Aging Medicine', 'Bariatrics', 'Breast Surgery', 'Cardiology - Cardiac Electrophysiology',
                'Clinical Genetics', 'Clinical Lipidology', 'Clinical Psychology', 'Cosmetic Surgery', 
                'Critical Care', 'Dentistry', 'Dentistry - Cosmetic', 'Dentistry - Endodontics', 
                'Dentistry - Orthodontics', 'Dentistry - Pediatric', 'Dentistry - Periodontics', 
                'Dentistry - Prosthodontics', 'Dermatology', 'Dermatopathology', 'Diagnostic Radiology',
                'Emergency Medicine', 'ENT - Head & Neck Surgery', 'ENT - Head & Neck Surgery - Pediatric',
                'Environmental Health', 'Facial Plastic Surgery', 'Family Medicine', 'Fertility Medicine', 
                'General Practice', 'Genetics Counseling', 'Gynecology', 'Gynecology - Oncology', 
                'Hair Restoration', 'Holistic Medicine', 'Integrative Medicine', 'Internal Medicine',
				'Internal Medicine & Pediatrics', 'Internal Medicine - Allergy', 
				'Internal Medicine - Allergy & Immunology', 'Internal Medicine - Cardiology', 
				'Internal Medicine - Diabetology', 'Internal Medicine - Gastroenterology', 
				'Internal Medicine - Geriatrics', 'Internal Medicine - Hematology', 
				'Internal Medicine - Hematology & Oncology', 'Internal Medicine - Hepatology', 
				'Internal Medicine - Hospital-based practice', 'Internal Medicine - Immunology',
				'Internal Medicine - Infectious Disease', 'Internal Medicine - Nephrology & Dialysis', 
				'Internal Medicine - Obstetric Medicine', 'Internal Medicine - Oncology',
				'Internal Medicine - Pulmonary Critical Care', 'Internal Medicine - Pulmonology', 
				'Internal Medicine - Rheumatology', 'Internal Medicine - Sleep Medicine', 'Neurology',
				'Neuroradiology', 'Neurosurgery', 'Nuclear Medicine', 'Obstetrics & Gynecology', 
				'Obstetrics & Gynecology - Maternal Fetal Medicine', 'Obstetrics & Gynecology - Urogynecology',
				'Occupational Medicine', 'Ophthalmology', 'Ophthalmology - LASIK Surgery', 'Ophthalmology - Pediatric', 
				'Ophthalmology - Retinal Surgery', 'Orthopedic Surgery', 'Orthopedic Surgery - Foot & Ankle',
				'Orthopedic Surgery - Pediatric', 'Orthopedic Surgery - Reconstruction', 'Orthopedic Surgery - Spine', 
				'Pain Management', 'Palliative Care', 'Pathology', 'Pediatric Rehabilitation Medicine',
				'Pediatric Rheumatology', 'Pediatrics', 'Pediatrics - Adolescent Medicine', 
				'Pediatrics - Allergy', 'Pediatrics - Allergy & Asthma', 'Pediatrics - Cardiology', 
				'Pediatrics - Critical Care', 'Pediatrics - Dermatology', 
				'Pediatrics - Developmental & Behavioral', 'Pediatrics - Emergency Medicine', 
				'Pediatrics - Endocrinology', 'Pediatrics - Gastroenterology', 
				'Pediatrics - Hematology & Oncology', 'Pediatrics - Infectious Disease', 'Pediatrics - Neonatology', 
				'Pediatrics - Nephrology & Dialysis', 'Pediatrics - Neurology', 'Pediatrics - Oncology', 'Pediatrics - Psychiatry',
				'Pediatrics - Pulmonology', 'Pediatrics - Sports Medicine', 'Pediatrics - Urology', 'Pharmacology', 
				'Phlebology', 'Physical & Rehabilitation Medicine', 'Podiatry', 'Preventive Medicine', 'Psychiatry', 
				'Psychiatry - Geriatric', 'Public Health', 'Radiation Oncology', 'Radiology', 'Radiology - Interventional', 
				'Sports Medicine', 'Surgery', 'Surgery - Colorectal', 'Surgery - Hand Surgery', 'Surgery - Head & Neck', 
				'Surgery - Oncology', 'Surgery - Oral & Maxillofacial', 'Surgery - Pediatric', 'Surgery - Plastics', 
				'Surgery - Thoracic', 'Surgery - Transplant', 'Surgery - Trauma', 'Surgery - Vascular', 'Toxicology', 
				'Transfusion Medicine', 'Travel Medicine', 'Undersea and Hyperbaric Medicine', 'Urgent Care', 
				'Urology', 'Urology - Oncology', 'Wilderness Medicine', 'Wound care']


  validates :speciality, presence: true
  validates :degree, presence: true
  validates :professional_license, presence: true
  validates :year_of_completion, presence: true
  
  DEGREES = ['D', 'MDCM', 'DO', 'MBBS', 'MBChB', 'DMD', 'DDS', 'DPM', 'EdD', 'PsyD', 'PhD', 'PharmD']

end
