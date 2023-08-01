class StudentApplicationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @student_application = StudentApplication.new
    @class_number = params[:section_number]
  end

  def create
    @student_application = StudentApplication.new(student_application_params)

    if @student_application.save
      redirect_to root_path, notice: 'Application submitted successfully!'
    else
      render :new
    end
  end

  def destroy
    student_application = StudentApplication.find(params[:id])
    student_application.destroy
    redirect_to root_path, notice: "Application has been deleted."
  end

  private

  def student_application_params
    params.require(:student_application).permit(:email, :class_number,:application_text)
  end
end