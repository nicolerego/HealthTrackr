class Appointment < ActiveRecord::Base
  belongs_to :doctor
  belongs_to :user

  validates :doctor_id, :date, :time, presence: true

  scope :most_recent, -> {Appointment.where('date < ?', Date.today).order(date: :desc).limit(1)}
  scope :next_appt, -> {Appointment.where('date > ?', Date.today).order(date: :asc).limit(1)}
  
end
