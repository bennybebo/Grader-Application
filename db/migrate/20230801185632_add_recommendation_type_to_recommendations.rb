class AddRecommendationTypeToRecommendations < ActiveRecord::Migration[7.0]
  def change
    add_column :recommendations, :recommendation_type, :string
  end
end
