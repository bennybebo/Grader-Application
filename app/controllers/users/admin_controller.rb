class Users::AdminController < ApplicationController
    before_action :authenticate_admin!
  
    def approval_page
        @unapproved_users = User.where(user_type: ['Instructor', 'Admin'], approved: false)
    end
  
    def approve_user
        @user = User.find(params[:id])
        @user.update(approved: true)
        redirect_to approval_page_path, notice: 'User approved.'
    end

    def grader_assignment_page
      @requests = Recommendation.includes(:section).where(request_for_grader: true)
      @endorsements = Recommendation.includes(:section).where(endorsement: true)
      @applications = StudentApplication.all
    end

    def authenticate_admin!
      unless current_user&.user_type == 'Admin'
        redirect_to root_path, alert: "Access denied."
      end
    end
  end