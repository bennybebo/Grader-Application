# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version = 3.2.0

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

* How to run our application:
* Follow the steps here: https://osu.instructure.com/courses/143658/pages/setting-up-a-development-environment?module_item_id=10221842
* Open VS Code and click on the bottom left corner to open a remote connection, then select connect to WSL.
* Navigate to the top of this github page, hit the green code button and copy the HTTPS link to your clipboard.
* In VS Code navigate to what folder you want to create the application. Once inside open a terminal and type the command: git clone https://github.com/cse-3901-sharkey/2023-SU-Team-2-Lab-2.git
* Then open the newly created app folder in VS Code
* Run these commands in your terminal:
  rails db:migrate
  bundle install
  rails db:seed
* Now you are prepared to run the application. Type 'rails server' into terminal and follow the link printed in the terminal to open it in your browser. (Should look like: * Listening on http://127.0.0.1:3000)
* You can sign up with a new account or use the default admin account to log in. Admin account credentials (email: admin.1@osu.edu, password: password)
