function Round(attributes) {
  this.id = attributes.id
  this.score = attributes.score
  this.golfer_id = attributes.golfer.id
  this.golfer_name = attributes.golfer_name
  this.display_from_par = attributes.display_from_par
  this.created_at_simple = attributes.created_at_simple
  this.golf_course_id = attributes.golf_course_id
}

Round.prototype.renderGolfCourseRound = function() {
  return GolfCourse.showRoundTemplate(this)
}
