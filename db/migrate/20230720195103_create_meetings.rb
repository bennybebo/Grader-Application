class CreateMeetings < ActiveRecord::Migration[7.0]
  def change
    create_table :meetings do |t|
      t.time :start_time
      t.time :end_time
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.string :location
      t.integer :section_number

      t.timestamps
    end

    add_foreign_key :meetings, :sections, column: :section_number, primary_key: :section_number
  end
end
