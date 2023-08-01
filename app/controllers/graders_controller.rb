class GradersController < ApplicationController
    before_action :authenticate_user!
  
    def make_grader
      section = Section.find(params[:class_number])
      section.increment!(:graders_assigned)

      recommendation = Recommendation.find_by(receiver_email: params[:email], class_number: params[:class_number])
      if recommendation
        recommendation.destroy
      end
      
      Grader.create(email: params[:email], class_number: params[:class_number])
      redirect_to root_path, notice: "Student has been assigned as a grader for the section."
    end
  end
  