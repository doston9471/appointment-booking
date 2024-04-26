require 'csv'

namespace :import do
  desc "Import coaches from CSV"
  task coaches: :environment do
    csv_file = Rails.root.join('data.csv')
    CSV.foreach(csv_file, headers: true) do |row|
      coach = Coach.find_or_initialize_by(full_name: row['Name'], timezone: row['Timezone'])
      coach.save!

      Schedule.create!(
        coach: coach,
        day: row['Day of Week'],
        available_start: Time.zone.parse(row['Available at']),
        available_end: Time.zone.parse(row['Available until'])
      )
    end
  end
end
