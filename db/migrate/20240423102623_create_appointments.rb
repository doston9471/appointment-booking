class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.references :coach, null: false, foreign_key: true
      t.datetime :start_time
      t.datetime :end_time
      t.string :day

      t.timestamps
    end
  end
end
