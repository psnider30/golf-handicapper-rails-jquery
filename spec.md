# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (Golfer has_many Rounds, GolfCourse has_many Rounds)
- [x] Include at least one belongs_to relationship (Round belongs_to Golfer, Round belongs_to GolfCourse)
- [x] Include at least one has_many through relationship (Golfer has_many GolfCourses through Rounds, GolfCourse has_many Golfers through Rounds)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (round.score)
- [x] Include reasonable validations for simple model objects (Golfer - devise :database_authenticatable, :validatable, validates_presence_of :name
      GolfCourse - validates_uniqueness_of :name, validates :holes, numericality: { equal_to: 18 },
      validates :total_par, numericality: { greater_than: 62 },
      validates :course_rating, numericality: { greater_than: 60 },
      validates :course_slope, numericality: { greater_than: 99 }
      Round - validates_presence_of :score, :golfer_id, :golf_course_id)

- [x] Include a class level ActiveRecord scope method (GolfCourse.highest_course_slope, URL: root, GolfCourse.lowest_course_slope, URL: root,
      GolfCourse.course_lowest_round, URL: /golf_courses/:id)
- [x] Include a nested form writing to an associated model using a custom attribute writer (form URL: /golfers/:golfer_id/rounds/new for GolfCourse,
        and golf_courses/new or golf_courses/edit for Tag)
- [x] Include signup (Devise)
- [x] Include login (Devise)
- [x] Include logout (Devise)
- [x] Include third party signup/login (URL: /golfers/auth/facebook, Controller: omniauth/omniauth_callbacks#facebook AND
      URL: /golfers/auth/google_oauth2, Controller: omniauth/omniauth_callbacks#google_oauth2)
- [x] Include nested resource show or index (URL: /golf_courses/:golf_course_id/rounds)
- [x] Include nested resource "new" form (URL: /golfers/:golfer_id/rounds/new)
- [x] Include form display of validation errors (form URL: /golf_courses/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
