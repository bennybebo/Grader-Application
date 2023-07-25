class RemoveForeignKeyFromMeetings < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :meetings, :sections
  end
end
