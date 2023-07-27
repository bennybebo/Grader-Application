class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
      t.integer :grade_id
      t.string :student_id
      t.string :course_num
      t.string :score
      t.boolean :qualified
      t.timestamps
    end

    add_foreign_key :grades, :courses, column: :course_num, primary_key: :course_number
    add_foreign_key :grades, :users, column: :student_id, primary_key: :email
  end
end
