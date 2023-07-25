require 'json'
require 'httparty'
require 'pagy'

class CoursesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_course, only: [:show, :edit, :update, :destroy]

    def index
      @courses = Course.order(course_number: :asc)
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
      @course = Course.find(params[:id])
      @course.sections.destroy_all
      @course.destroy
      redirect_to courses_path, notice: 'Course and sections were successfully deleted.'
    end
  
    def set_course
      @course = Course.find(params[:id])
    end
  
    def course_params
      params.require(:course).permit(:id, :course_title, :course_description)
    end

    def load_courses
      base_url = "https://content.osu.edu/v2/classes/search"
      search_string = 'cse'
      term = '1238'
      campus = 'col'
      career = 'ugrd'
      subject = 'cse'

      client = HTTParty.get("https://content.osu.edu/v2/classes/search?q=cse&campus=col&term=1238")

      # Parse the initial response and get data
      json_response = JSON.parse(client.body)
      data = json_response['data']

      if data.nil? || data.empty?
        puts "No data available."
        exit
      end

      total_pages = data['totalPages']

      # Initialize the Pagy object
      pagy = Pagy.new(count: total_pages, page_param: 'p')
      # Iterate over each page
      pagy.pages.times do |page|
        # Make request with updated page number
        #puts "TESTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT"
        response = HTTParty.get(base_url, query: {
          q: 'cse',
          campus: 'col',
          p: page + 1,
          'academic-career': 'ugrd',
          subject: 'cse',
          term: '1238'
        })

        # Parse response and get data
        json_response = JSON.parse(response.body)
        data = json_response['data']

        if data.nil? || data.empty?
          puts "No data available."
          exit
        end

        # Loop over all the courses on the page
        data['courses'].each do |course_entry|
          course = course_entry['course']

          course_number = course['catalogNumber']
          # Create or find the course in the database
          course_record = Course.find_or_initialize_by(course_number: course_number)
          course_record.course_name = course['title']
          course_record.course_description = course['description']
          course_record.campus = course['campus']
          course_record.term = course['term']

          # Loop over all the sections
          course_entry['sections'].each do |section_entry|
            section_number  = section_entry['section']
            section = Section.find_or_initialize_by(course_number: course_number, section_number: section_number)
            section.course = course_record
            section.class_number = section_entry['classNumber']
            section.component = section_entry['component']
            section.course_number = course_number
            section.graders_needed = 1
            section.graders_assigned = 0

            #Loop over all meetings
            section_entry['meetings'].each do |meeting_entry|
              meeting = Meeting.find_or_initialize_by(section_number: section_number)
              meeting.start_time = meeting_entry['startTime']
              meeting.end_time = meeting_entry['endTime']
              meeting.monday = meeting_entry['monday']
              meeting.tuesday = meeting_entry['tuesday']
              meeting.wednesday = meeting_entry['wednesday']
              meeting.thursday = meeting_entry['thursday']
              meeting.friday = meeting_entry['friday']
              meeting.saturday = meeting_entry['saturday']
              meeting.sunday = meeting_entry['sunday']
              meeting.location = meeting_entry['facilityDescription'] || 'TBA'

              #Add instructor info somewhere??
              meeting.save
            end
            section.save
          end
        puts "\n"
        course_record.save
      end
      render json: { message: 'Courses were successfully loaded.' }
    end
  end
end 