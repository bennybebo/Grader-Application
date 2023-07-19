class ChangeCoursesTable < ActiveRecord::Migration[7.0] 
  def change
    create_table :new_courses, id: false do |t|
      t.string :course_number, primary_key: true
      t.string :course_name
      t.text :course_description
      t.string :campus
      t.string :term
    end

    drop_table :courses
    rename_table :new_courses, :courses
  end
end


