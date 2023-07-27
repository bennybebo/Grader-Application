class AddForeignKeyToMeetingsTable < ActiveRecord::Migration[7.0]
  def change
    add_reference :meetings, :section, foreign_key: { to_table: :sections, primary_key: :class_number }
  end
end
