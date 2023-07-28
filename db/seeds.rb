# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.new(email: 'admin.1@osu.edu', password: 'password', user_type: 'Admin',  approved: true)
user.save!

course = Course.new(course_number: 'CSE 3901',course_name: 'Project: Web Apps', course_description: 'It is a nice course.', 
    campus: 'COL', term: 'Summer')
course.save!

section = Section.new(section_number: '6442', class_number: '40', course_number: 'CSE 3901', component: 'CSE', 
    graders_needed: '1', graders_assigned: '1')
section.save!

meeting = Meeting.new(section_number: '6442', class_number: '40', start_time: Time.parse("6:30 PM"), 
    end_time: Time.parse("8:00 PM"), monday: false, tuesday: true, wednesday: false, thursday: true, friday: false, 
    location: 'online' )
meeting.save!
