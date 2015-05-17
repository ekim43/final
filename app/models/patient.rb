class Patient < ActiveRecord::Base
has_many :appointments
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
has_secure_password
end
