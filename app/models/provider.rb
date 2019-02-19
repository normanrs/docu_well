class Provider < ApplicationRecord
  has_many :appointments
  validates_presence_of :surname, :street_address, :city, :state, :phone, on: :create


  enum state: [:AK,:AL,:AR,:AZ,:CA,:CO,:CT,:DE,:FL,:GA,:HI,:IA,:ID,:IL,:IN,:KS,:KY,:LA,
               :MA,:MD,:ME,:MI,:MN,:MO,:MS,:MT,:NC,:ND,:NE,:NH,:NJ,:NM,:NV,:NY,:OH,:OK,
               :OR,:PA,:RI,:SC,:SD,:TN,:TX,:UT,:VA,:VT,:WA,:WI,:WV,:WY]

  enum speciality: [:allergist, :anesthesiologist, :cardiologist, :dentist, :dermatologist,
                    :endocrinologist, :general_practitioner, :gastroenterologist, :geneticist,
                    :geriatric_specialist, :gynecologist, :hematologist, :internist, :massage_therapist,
                    :naturopath, :nephrologist, :neurologist, :obstetrician, :oncologist, :ophthalmologist,
                    :optometrist, :osteopath, :palliative, :pediatrician, :podiatrist, :psychiatrist,
                    :pulmonologist, :radiologist, :rheumatologist, :surgeon, :urologist]             
end
