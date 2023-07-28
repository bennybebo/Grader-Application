class ChangeInstructorsTable < ActiveRecord::Migration[7.0] 
  def change
    create_table :new_instructors do |t|
      t.string :instructor_name
      t.string :instructor_email
      t.integer :class_number

      t.timestamps
    end

    drop_table :instructors
    rename_table :new_instructors, :instructors
    add_foreign_key :instructors, :meetings, column: :class_number
  end
end
