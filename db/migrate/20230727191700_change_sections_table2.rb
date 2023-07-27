class ChangeSectionsTable2 < ActiveRecord::Migration[7.0] 
  def change
    create_table :new_sections, id: :integer, primary_key: :class_number do |t|
      t.integer :section_number
      t.string :component
      t.string :course_number
      t.integer :graders_needed
      t.integer :graders_assigned

      t.timestamps
    end

    drop_table :sections
    rename_table :new_sections, :sections
    add_foreign_key :sections, :courses, column: :course_number, primary_key: :course_number
  end
end
