class Doctor < ActiveRecord::Base
  belongs_to :user
  has_many :appointments
  validates :name, :phone, :address, presence: true
end
