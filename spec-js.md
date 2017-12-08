# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [x] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend. (Golfer show page can be rendered through jQuery with next button)
- [x] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend. (GolfCourse rounds index page can be rendered using jQuery with show rounds button)
- [x] Include at least one has_many relationship in information rendered via JSON and appended to the DOM. (For Golfer GolfCourse show page(s) json includes Golfer and GolfCourse has many rounds)
- [x] Use your Rails API and a form to create a resource and render the response without a page refresh. (On GolfCourse show page new comment can be created from rails api and commented rendered on page via ajax)
- [x] Translate JSON responses into js model objects. (In app/assets/javascripts/ golfers.js and golf_course.js)
- [x] At least one of the js model objects must have at least one method added by your code to the prototype. (In golfer.js - Golfer.prototype.renderGolfer, Golfer.prototype.renderRounds)

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
