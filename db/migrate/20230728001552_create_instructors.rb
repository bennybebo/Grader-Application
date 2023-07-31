class CreateInstructors < ActiveRecord::Migration[7.0]  
  def change
    create_table :instructors do |t|
      t.string :instructor_name
      t.string :instructor_email
      t.integer :meeting_id

      t.timestamps
    end

    add_foreign_key :instructors, :meetings, column: :meeting_id
    add_index :instructors, :meeting_id
  end
end
