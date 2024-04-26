class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.references :coach, null: false, foreign_key: true
      t.string :day
      t.time :available_start
      t.time :available_end

      t.timestamps
    end
  end
end
