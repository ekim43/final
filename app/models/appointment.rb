class Appointment < ActiveRecord::Base
validates :patient_id, presence: true
validates :doctor_id, presence: true
validates :test_id, presence: true

 belongs_to :doctor
 belongs_to :patient
 belongs_to :test
end
