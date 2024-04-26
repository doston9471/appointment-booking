class Appointment < ApplicationRecord
  belongs_to :coach
  validate :validate_time_slot_uniqueness
  validates :day, :start_time, :end_time, presence: true

  private

  def validate_time_slot_uniqueness
    if coach.appointments.where(start_time: start_time).exists?
      errors.add(:start_time, "is already booked")
    end
  end
end
