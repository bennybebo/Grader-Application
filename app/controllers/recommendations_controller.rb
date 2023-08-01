class RecommendationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @recommendation = Recommendation.new
    @class_number = params[:section_number]
  end

  def create
    @recommendation = Recommendation.new(recommendation_params)
    @recommendation.recommender_email = current_user.email
    
    if @recommendation.recommendation_type == 'endorsement'
      @recommendation.endorsement = true
    else
      @recommendation.request_for_grader = true
    end
    
    if @recommendation.save
      redirect_to root_path, notice: 'Recommendation submitted successfully!'
    else
      render :new
    end
  end

  def destroy
    recommendation = Recommendation.find(params[:id])
    recommendation.destroy
    redirect_to grader_assignment_page_path, notice: "Recommendation has been deleted."
  end

  private

  def recommendation_params
    params.require(:recommendation).permit(:receiver_email, :recommender_email,:recommendation_text, :endorsement, :request_for_grader, :class_number, :recommendation_type)
  end
end
