function GolfCourseComment(attributes) {
  this.id = attributes.id;
  this.golf_course_id = attributes.golf_course_id;
  this.golfer_id = attributes.golfer_id
  this.content = attributes.content;
  this.golfer_name = attributes.golfer_name;
  this.created_at_simple = attributes.created_at_simple;
}

GolfCourseComment.prototype.renderGolfCourseComment = function() {
  return GolfCourse.showCommentTemplate(this)
}

GolfCourseComment.prototype.destroy = function(commentId) {
  $(`#golf-course-comment-${commentId}`).remove()
}
