# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (Golfer has_many Rounds, GolfCourse has_many Rounds)
- [x] Include at least one belongs_to relationship (Round belongs_to Golfer, Round belongs_to GolfCourse)
- [x] Include at least one has_many through relationship (Golfer has_many GolfCourses through Rounds, GolfCourse has_many Golfers through Rounds)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (round.score)
- [x] Include reasonable validations for simple model objects (Golfer - devise :database_authenticatable, validatable, :validatable,
      GolfCourse - validates_uniqueness_of :name, validates :holes, numericality: { equal_to: 18 })
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [ ] Include a nested form writing to an associated model using a custom attribute writer (form URL, model name e.g. /recipe/new, Item)
- [ ] Include signup (how e.g. Devise)
- [ ] Include login (how e.g. Devise)
- [ ] Include logout (how e.g. Devise)
- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
