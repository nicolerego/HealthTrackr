class Medication < ActiveRecord::Base
  belongs_to :user
  
  validates :name, :amount, :started_at, presence: true
end
