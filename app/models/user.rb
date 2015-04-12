class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :first_name, :email, :password, :password_confirmation, presence: true

  validates :email, uniqueness: true

  has_many :medications
  has_many :doctors
  has_many :appointments
  
end
