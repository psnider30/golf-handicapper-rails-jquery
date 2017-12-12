function GolfCourse(attributes) {
  this.id = attributes.id;
  this.name = attributes.name;
  this.description = attributes.description;
  this.holes = attributes.holes;
  this.total_par = attributes.total_par;
  this.course_slope = attributes.course_slope;
  this.course_rating = attributes.course_rating;
  this.rounds = attributes.rounds;
  this.tags = attributes.tags;
  this.golf_course_comments = attributes.golf_course_comments;
}

$(function() {
  if ($(".btn-info.show-rounds").length > 0) {
    GolfCourse.ready()

    var currentGolferId = $("#gc-show-comment-template").data("id")
    Handlebars.registerHelper('ifPermissionGC',function(a, options) {
      if (a === currentGolferId) {
        return options.fn(this);
      } else {
        return options.inverse(this);
      }
    });
  }
});

GolfCourse.ready = function() {
  GolfCourse.showRoundsListener()
  GolfCourse.postRoundListener()
  GolfCourse.postCommentListener()
  GolfCourse.deleteCommentListener()
  // select template html
  GolfCourse.golfCourseRoundsHandlebars = $("#golf-course-rounds-template").html();
  GolfCourse.showRoundHandlebars = $("#gc-show-round-template").html();
  GolfCourse.showCommentHandlebars = $("#gc-show-comment-template").html();

  GolfCourse.golfCourseRoundsTemplate = Handlebars.compile(GolfCourse.golfCourseRoundsHandlebars);
  GolfCourse.showRoundTemplate = Handlebars.compile(GolfCourse.showRoundHandlebars);
  GolfCourse.showCommentTemplate = Handlebars.compile(GolfCourse.showCommentHandlebars);
}

GolfCourse.showRoundsListener = function() {
  $showRounds = $(".btn-info.show-rounds");
  $showRounds.on("click", function(e) {
    e.preventDefault();
    var id = $(this).data("id");
    GolfCourse.getGolfCourseRounds(id)
  });
}

GolfCourse.postRoundListener = function() {
  $postRound = $(".gc-post-round");
  $postRound.on("submit", function(e) {
    e.preventDefault();
    var score = this.round_score.value
    if (score === "" || score < 36 || score > 180) {
      $("#roundBlank").html("<h4>That can't be right. What was your score?<h4>")
      $("#post-round").attr("disabled", false);
    } else {
      $("#roundBlank").html("")
      var roundValues = $(this).serialize();
      var id = $("#round_golf_course_id").val();
      GolfCourse.postGolfCourseRound(roundValues, id)
    }
  });
}

GolfCourse.postCommentListener = function() {
  $('.gc-post-comment').on("submit", function(e) {
    e.preventDefault();
    var $commentContent = $("#golf_course_comment_content");
    if ($commentContent.val() !== "") {
      $("#comment-error").html("")
      var commentValues = $(this).serialize();
      var url = this.action
      GolfCourse.postGolfCourseComment(url, commentValues)
    } else {
      $("#comment-error").html("<h5>Did you want to post a comment?</h5>")
      $("#post-comment").attr("disabled", false)
    }
  });
}

GolfCourse.deleteCommentListener = function() {
  $('.gc-comment-destroy-button').on('click', function(e) {
    $(this).unbind('click');
    e.preventDefault();
    GolfCourse.deleteComment(this)
  });
}

GolfCourse.getGolfCourseRounds = function(id) {
  $.get("/golf_courses/" + id + ".json")
    .done(function(rounds) {
      if ($.trim(rounds)) {
        GolfCourse.doneGetGolfCourseRounds(rounds)
        console.log(rounds);
      } else {
        alert("No Rounds Posted")
      }
    })
    .fail(GolfCourse.failGetGolfCourseRounds)
}

GolfCourse.postGolfCourseRound = function(roundValues, id) {
  var postRound = $.post("/golf_courses/" + id + "/rounds", roundValues)
  .done(GolfCourse.donePostGolfCourseRound)
  .fail(GolfCourse.failPostGolfCourseRound)
}

GolfCourse.postGolfCourseComment = function(url, commentValues) {
  var postComment = $.post(url, commentValues)
  .done(GolfCourse.donePostGolfCourseComment)
  .fail(GolfCourse.failPostGolfCourseComment)
}

GolfCourse.deleteComment = function(deleteButton) {
  $.ajax( {
    url: $(deleteButton).attr("href"),
    dataType: 'json',
    method: $(deleteButton).attr("data-method")
  })
  .success(GolfCourse.successDeleteComment)
  .error(function(response) {
    console.log(response)
  });
}


GolfCourse.doneGetGolfCourseRounds = function(golfCourseJson) {
  var golfCourse = new GolfCourse(golfCourseJson);
  var id = golfCourse.id
  var showCourseRounds = golfCourse.renderGolfCourseRounds()
  $(`#all-rounds-gc-${id}`).html(showCourseRounds)
}

GolfCourse.donePostGolfCourseRound = function(roundJson) {
  $('#round_score').val('');
  var round = new Round(roundJson);
  var showRound = round.renderGolfCourseRound()
  var golfCourseId = round.golf_course_id;
  $(`#all-rounds-gc-${golfCourseId}`).html(showRound)
}

GolfCourse.donePostGolfCourseComment = function(commentJson) {
  if (!commentJson) {$("#comment-error").html("<h5>You already been said about this course, be original ;)</h5>")}
  $('#golf_course_comment_content').val('')
  var comment = new GolfCourseComment(commentJson);
  var golfCourseId = comment.golf_course_id;
  var showComment = comment.renderGolfCourseComment()
  $(`#golf-course-comments-${golfCourseId}`).append(showComment)

  $('#gc-comment-destroy-button-' + comment.id).on('click', function(e) {
    $(this).unbind('click');
    e.preventDefault();
    GolfCourse.deleteComment(this)
  });
}

GolfCourse.successDeleteComment = function(commentJson) {
  var comment = new GolfCourseComment(commentJson);
  comment.destroy(comment.id);
}

GolfCourse.failGetGolfCourseRounds = function(response) {
  console.log("Get gc rounds is busted!", response)
}

GolfCourse.failPostGolfCourseRound = function(response) {
  $("#roundBlank").html("<h4>Uh, what was your score?</h4>")
  console.log("Post round is busted!", response)
  $("#post-round").attr("disabled", false)
}

GolfCourse.failPostGolfCourseComment = function(response) {
  $("#comment-error").html("<h5>That's already been said about this course, be original ;)</h5>")
  console.log("Post Comment Broke!", response)
  $("#post-comment").attr("disabled", false)
}

GolfCourse.prototype.renderGolfCourseRounds = function() {
  return GolfCourse.golfCourseRoundsTemplate(this)
}

// Round.prototype.renderGolfCourseRound in rounds.js
// Comment.prototype.renderGolfCourseComment in golf_course_comments.js

//   Handlebars.registerHelper("log", function(something) {
//   console.log(something);
// });
