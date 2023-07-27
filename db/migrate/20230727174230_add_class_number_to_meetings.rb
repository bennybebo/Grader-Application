class AddClassNumberToMeetings < ActiveRecord::Migration[7.0]
  def change
    add_column :meetings, :class_number, :integer
  end
end
