class DoctorProfile < ActiveRecord::Base

  belongs_to :profile

  has_many :stripe_access_creds

  validates :speciality, presence: true
  validates :degree, presence: true
  validates :professional_license, presence: true
  validates :year_of_completion, presence: true

  DEGREES = ['M.D.', 'D.O.', 'M.D. PhD']
  SPECIALITY = ['Addiction Medicine', 'ADHD and Autism', 'Aesthetic Medicine', 'Anesthesiology',
                'Anti-Aging Medicine', 'Bariatrics', 'Cardiology - Cardiac Electrophysiology',
                'Clinical Genetics', 'Clinical Lipidology', 'Clinical Psychology', 
                'Critical Care', 'Dermatology', 'Dermatopathology', 'Diagnostic Radiology',
                'Emergency Medicine', 'Environmental Health', 'Family Medicine', 'Fertility Medicine', 
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
                'Occupational Medicine', 'Ophthalmology', 'Ophthalmology - Pediatric', 
                'Pain Management', 'Palliative Care', 'Pathology', 'Pediatric Rehabilitation Medicine',
                'Pediatric Rheumatology', 'Pediatrics', 'Pediatrics - Adolescent Medicine', 
                'Pediatrics - Allergy', 'Pediatrics - Allergy & Asthma', 'Pediatrics - Cardiology', 
                'Pediatrics - Critical Care', 'Pediatrics - Dermatology', 
                'Pediatrics - Developmental & Behavioral', 'Pediatrics - Emergency Medicine', 
                'Pediatrics - Endocrinology', 'Pediatrics - Gastroenterology', 'Pediatrics - Hematology & Oncology',
                'Pediatrics - Infectious Disease', 'Pediatrics - Neonatology', 'Pediatrics - Nephrology & Dialysis', 
                'Pediatrics - Neurology', 'Pediatrics - Oncology', 'Pediatrics - Psychiatry',
                'Pediatrics - Pulmonology', 'Pediatrics - Sports Medicine', 'Pediatrics - Urology', 'Pharmacology', 
                'Phlebology', 'Physical & Rehabilitation Medicine', 'Podiatry', 'Preventive Medicine', 'Psychiatry', 
                'Psychiatry - Geriatric', 'Public Health', 'Radiation Oncology', 'Radiology', 'Radiology - Interventional', 
                'Sports Medicine', 'Toxicology', 'Transfusion Medicine', 'Travel Medicine', 'Undersea and Hyperbaric Medicine', 
                'Urgent Care', 'Urology', 'Urology - Oncology', 'Wilderness Medicine', 'Wound care']
  
end
