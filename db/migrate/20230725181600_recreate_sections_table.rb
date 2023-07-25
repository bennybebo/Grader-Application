class RecreateSectionsTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :sections, if_exists: true

    create_table :sections do |t|
      t.integer :section_number
      t.integer :class_number
      t.string :component
      t.string :course_number
      t.integer :graders_needed
      t.integer :graders_assigned
      t.timestamps
    end
  end

  def down
    drop_table :sections, if_exists: true

    create_table :sections do |t|
      t.integer :class_number
      t.string :component
      t.string :course_number
      t.integer :graders_needed
      t.integer :graders_assigned
      t.timestamps
    end
  end
end
