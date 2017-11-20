# Golf Handicapper Rails App

This is a Rails web app with content management system and restful routes for tracking golfer handicaps. A user must login or sign up to use the website. Then they can create and edit golf courses, including, creating and editing tags, and creating and editing rounds of golf while tracking handicap index. Summary information about golfers and golf courses and their nested routes are shown through restful routes. The app uses the devise gem for registrations and sessions and also uses custom authentication methods to regulate CRUD actions. Users can also login with facebook or google using omniauth. The five models tied to active record are golfers, golf_courses, rounds (join model), tags, and golf_course_tags (join model). The bootstrap sass gem is used for css styling.

Things you may want to cover:

# Instruction:
1. Navigate to the link: https://github.com/psnider30/golf-handicapper-rails-app
2. Click the 'Clone or Download' button
3. Copy the link
4. In Command Line or your terminal, type 'git clone ' then paste the .git URL you copied
5. Run 'bundle install', by typing 'bundle install' into terminal
6. Type 'rake db:migrate'
7. Launch the application by typing 'rails server' or 'rails s' into the terminal
8. Browse to the url shown in your terminal, which should be, http://localhost:3000/, unless you use a different port.
9. Type 'control + c' in terminal to stop the local server and exit the application

# Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/psnider30/golf-handicapper-rails-app. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the Contributor Covenant code of conduct.

# License
The app is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
