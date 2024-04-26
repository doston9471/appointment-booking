class Coach < ApplicationRecord
  has_many :schedules
  has_many :appointments

  def available_days
    schedules.pluck(:day).uniq
  end

  def available_slots(selected_day)
    selected_day = selected_day.presence || Date.today.strftime('%A') # Default to today's day
    day_schedules = schedules.where(day: selected_day)
    all_slots = []

    day_schedules.each do |schedule|
      taken_slots = appointments.where(start_time: schedule.available_start..schedule.available_end).pluck(:start_time)
      start_time = schedule.available_start
      end_time = schedule.available_end

      while start_time < end_time
        all_slots << start_time unless taken_slots.include?(start_time)
        start_time += 30.minutes
      end
    end
    all_slots
  end
end
