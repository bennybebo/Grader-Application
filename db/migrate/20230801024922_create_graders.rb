class CreateGraders < ActiveRecord::Migration[7.0]
  def change
    create_table :graders do |t|
      t.string 'email'
      t.string 'class_number'

      t.timestamps
    end
  add_foreign_key :graders, :sections, column: :class_number, primary_key: :class_number
  add_foreign_key :graders, :users, column: :email, primary_key: :email
  end
end
