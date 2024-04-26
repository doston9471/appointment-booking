class CreateCoaches < ActiveRecord::Migration[7.1]
  def change
    create_table :coaches do |t|
      t.string :full_name
      t.string :timezone

      t.timestamps
    end
  end
end
