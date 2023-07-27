class CreateApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :applications do |t|
      t.integer :app_id
      t.string :student_id
      t.integer :section_num, foreign_key: {to_table: :sections, column: :section_number}
      t.boolean :status

      t.timestamps
    end

    add_foreign_key :applications, :users, column: :student_id, primary_key: :email
  end
end
