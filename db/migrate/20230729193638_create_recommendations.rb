class CreateRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :recommendations do |t|
      t.string :receiver_email, null: false
      t.string :recommender_email, null: false
      t.text :recommendation_text
      t.boolean :endorsement, default: false
      t.boolean :request_for_grader, default: false

      t.timestamps
    end

    add_foreign_key :recommendations, :users, column: :receiver_email, primary_key: :email
    add_foreign_key :recommendations, :users, column: :recommender_email, primary_key: :email
  end
end
