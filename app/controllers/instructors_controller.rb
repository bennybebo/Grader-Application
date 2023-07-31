class InstructorsController < ApplicationController
    def index
      @instructors = Instructor.all
    end
  
    def show
      @instructor = Instructor.find(params[:id])
    end
  
    def new
      @instructor = Instructor.new
    end
  
    def create
      @instructor = Instructor.new(instructor_params)
      if @instructor.save
        redirect_to @instructor, notice: 'Instructor was successfully created.'
      else
        render :new
      end
    end
  
    def instructor_params
      params.require(:instructor).permit(:instructor_name, :instructor_email, :meeting_id)
    end
  end