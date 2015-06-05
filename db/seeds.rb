# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Deletes everything from the database so that you start fresh
puts "Deleting all records from the database..."
Patient.delete_all
Doctor.delete_all
Test.delete_all
Appointment.delete_all

puts "Creating new patients..."
kim = Patient.create(first_name: "Eugene", last_name: "Kim", password: "password1", email: "ekim2015@kellogg.northwestern.edu", gender: "male", marital_status: "married", blood_type: "A+")
mann = Patient.create(first_name: "Ryan", last_name: "Mann", password: "password2", email: "rmann2015@kellogg.northwestern.edu", gender: "male", marital_status: "single", blood_type: "O")
metzger = Patient.create(first_name: "Isaac", last_name: "Metzger", password: "password3", email: "imetzger2015@kellogg.northwestern.edu", gender: "male", marital_status: "married", blood_type: "O")
buntman = Patient.create(first_name: "Noah", last_name: "Buntman", password: "password4", email: "nbuntman2015@kellogg.northwestern.edu", gender: "male", marital_status: "single", blood_type: "B-")
lencz = Patient.create(first_name: "Davin", last_name: "Lencz", password: "password5", email: "dlencz2015@kellogg.northwestern.edu", gender: "male", marital_status: "single", blood_type: "A-")

puts "Creating doctors..."
brown = Doctor.create(first_name: "Will", last_name: "Brown", specialty: "Family Practice", new_patients: "Yes", image: "brown.jpg")
stevenson = Doctor.create(first_name: "Jess", last_name: "Stevenson", specialty: "OBGYN", new_patients: "Yes", image: "stevenson.jpg")
haq = Doctor.create(first_name: "Farzana", last_name: "Haq", specialty: "Family Practice", new_patients: "No", image: "haq.jpg")
ohashi = Doctor.create(first_name: "Jason", last_name: "Ohashi", specialty: "Oncology", new_patients: "No", image: "ohashi.jpg")
chan = Doctor.create(first_name: "Connie", last_name: "Chan", specialty: "Pediatrics", new_patients: "Yes", image: "chan.jpg")

puts "Creating tests..."
physical = Test.create(name: "Physical")
xray = Test.create(name: "Xray")
bloodtest = Test.create(name: "Bloodtest")
mri = Test.create(name: "MRI")
colonoscopy = Test.create(name: "Colonoscopy")

puts "Creating appointments..."
Appointment.create(patient_id: kim.id, doctor_id: brown.id, test_id: xray.id)
Appointment.create(patient_id: mann.id, doctor_id: chan.id, test_id: colonoscopy.id)
Appointment.create(patient_id: metzger.id, doctor_id: ohashi.id, test_id: mri.id)
Appointment.create(patient_id: buntman.id, doctor_id: haq.id, test_id: physical.id)
Appointment.create(patient_id: lencz.id, doctor_id: stevenson.id, test_id: bloodtest.id)

puts "There are now #{Patient.count} patients, #{Doctor.count} doctors, #{Test.count} tests, and #{Appointment.count} appointments in the database."