# Rails Final Project

## Table of Contents

- [What the Program Is](#what-the-program-is)
- [How to Download and Install It](#how-to-download-and-install-it)
- [System Dependencies and Configuration](#system-dependencies-and-configuration)
- [Database Creation and Initialization](#database-creation-and-initialization)
- [How to Use](#how-to-use)



## What the Program Is
This project aims to streamline the process of matching qualified undergraduate students with specific course sections for grading positions within the Computer Science and Engineering (CSE) department. Students can sign up, view the course catalog, and apply to be a grader for specific sections. Instructors can sign up, view the course catalog, and submit recommendations for students to become graders. Admins can sign up, view/edit the course catalog, approve instructor/admin accounts, and assign students to be graders for course sections.


## How to Download and Install It
  You must first setup a development environment.
1. Follow the steps here: https://osu.instructure.com/courses/143658/pages/setting-up-a-development-environment?module_item_id=10221842
2. Open VS Code and click on the bottom left corner to open a remote connection, then select connect to WSL.
3. Navigate to the top of this github page, hit the green code button and copy the HTTPS link to your clipboard.
4. In VS Code navigate to what folder you want to create the application. Once inside open a terminal and type the command: git clone https://github.com/cse-3901-sharkey/2023-SU-Team-2-Lab-2.git
5. Then open the newly created app folder in VS Code
6. Run these commands in your terminal:
  'rails db:migrate'
  'bundle install'
  'rails db:seed'
7. Now you are prepared to run the application. Type 'rails server' into terminal and follow the link printed in the terminal to open it in your browser. (Should look like: * Listening on http://127.0.0.1:3000)

## System Dependencies and Configuration
Ruby version:   Ruby version should be 3.2.0.  To check your Rails version use the command 'ruby -v'.

Rails version:  Rails version should be 7.0.  To check your Rails version use the command 'rails -v'.

Node:           Node should be 16. 

VScode:         We may recommend to use the latest version.


## Database Creation and Initialization
Before running the program, there are a few steps to do to setup the database.

1. To create the database, you may run 'rails db:create'.  However, Database 'db/development.sqlite3' already exists.

2. To migrate, you need to run 'rails db:migrate' to apply the database migration.

3. To make seed, you need to run 'rails db:seed' to create a default admin user account for approving new sign-ups.


## How to Use
Please start with the default admin user (email: admin.1@osu.edu, password: password) account. After logging in with admin email and password, go to top bar and click Course Catalog. It will direct to an empty page of Course Catalog for now. Click Reload Courses, and all the course information will be loaded to the system. (Click Course Catalog to refresh the page.)

Now, you can log out admin user account and sign up for the student, instructor, or admin user account. Student user account can be signed up directly, while both instructor and admin user account need approval from existed admin user. The approval can be done in Account Approval page in admin user homepage.