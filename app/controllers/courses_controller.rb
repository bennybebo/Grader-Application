class CoursesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_course, only: [:show, :edit, :update, :destroy]
    before_action :check_admin_role, only: [:new, :create, :edit, :update, :destroy]
  
    def index
      @courses = Course.all
    end
  
    def show
    end
  
    def new
      @course = Course.new
    end
  
    def create
      @course = Course.new(course_params)
      if @course.save
        redirect_to @course, notice: 'Course was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @course.update(course_params)
        redirect_to @course, notice: 'Course was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @course.destroy
      redirect_to courses_url, notice: 'Course was successfully destroyed.'
    end
  
    private
  
    def set_course
      @course = Course.find(params[:id])
    end
  
    def check_admin_role
      unless current_user.admin?
        redirect_to courses_path, notice: 'You are not authorized to perform this action.'
      end
    end
  
    def course_params
      params.require(:course).permit(:code, :title, :description, :level)
    end

    def fetch_courses
      # Construct the API URL with parameters
      api_url = "https://content.osu.edu/v2/classes/search?q=&campus=col&p=1&term=1222&academic-career=ugrad&subject=cse"
    
      begin
      response = HTTParty.get(api_url)
          if response.code == 200
            parsed_response = JSON.parse(response.body)
            
            if parsed_response["data"].present?
              parsed_response["data"].each do |course_data|
                course_code = course_data["courseCode"]
                title = course_data["title"]
                sections = course_data["sections"]
    
                course = Course.create(course_code: course_code, title: title)
    
                sections.each do |section_data|
                  section_number = section_data["sectionNumber"]
                  instructor = section_data["instructor"]
    
                  section = Section.create(section_number: section_number, instructor: instructor)
                  course.sections << section
                end
              end
            end
            
            flash[:success] = "Course data fetched successfully."
          else
            flash[:error] = "Error retrieving course data from the API."
          end
        rescue StandardError => e
          flash[:error] = "An error occurred: #{e.message}"
        end
        
        redirect_to root_path
      end    
  end
  