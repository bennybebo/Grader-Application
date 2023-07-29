class RecommendationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation = Recommendation.new(recommendation_params)
    @recommendation.recommender_email = current_user.email

    if @recommendation.save
      redirect_to root_path, notice: 'Recommendation submitted successfully!'
    else
      render :new
    end
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:receiver_email, :recommendation_text, :request_for_grader, :submitted_by_student)
  end
end
