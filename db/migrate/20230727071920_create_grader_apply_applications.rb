class CreateGraderApplyApplications < ActiveRecord::Migration[7.0]
  def change
    create_table :grader_apply_applications do |t|
      t.string :email
      t.integer :section_id

      t.timestamps
    end
  end
end
