class AddClassNumberToRecommendations < ActiveRecord::Migration[7.0]
  def change
    add_column :recommendations, :class_number, :integer
    add_foreign_key :recommendations, :sections, column: :class_number, primary_key: :class_number
  end
end
