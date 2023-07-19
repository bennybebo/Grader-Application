require 'json'
require 'httparty'
require 'pagy'

BASE_URL = "https://content.osu.edu/v2/classes/search"
SEARCH_STRING = 'cse'
TERM = '1238'
CAMPUS = 'col'
CAREER = 'ugrd'
SUBJECT = 'cse'

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
  response = HTTParty.get(BASE_URL, query: {
    q: SEARCH_STRING,
    campus: CAMPUS,
    p: page + 1,
    'academic-career': CAREER,
    subject: SUBJECT,
    term: TERM
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

    course_id = course['course_id']
    course_title = course['title']
    course_description = course['description']

    puts "CSE #{course_id}: #{course_title}"
    # Create or find the course in the database
    course_record = Course.find_or_initialize_by(course_id: course_id)
    course_record.course_title = course_title
    course_record.course_description = course_description

    # Loop over all the sections
    course_entry['sections'].each do |section_entry|
      section_entry['meetings'].each do |meeting_entry|
        startTime = meeting_entry['startTime']
        endTime = meeting_entry['endTime']
        days = meeting_entry.keys.select { |k| k.include?('day') }.map { |k| k.capitalize }
        location = meeting_entry['room'] || meeting_entry['facilityDescription'] || 'TBA'

        meeting_entry['instructors'].each do |instructor_entry|
          instructorName = instructor_entry['displayName'] || 'TBA'
          instructorEmail = instructor_entry['email'] ? " (#{instructor_entry['email']})" : ''
          #puts "Instructor: #{instructorName}#{instructorEmail}"
        end

        section = course_record.sections.build(
          start_time: start_time,
          end_time: end_time,
          days: days.join(', '),
          location: location,
          instructor_name: instructor_name,
          instructor_email: instructor_email
        )

        #puts "Location: #{location}"
        section.save
      end
    end

    puts "\n"
    course_record.save
  end
end
