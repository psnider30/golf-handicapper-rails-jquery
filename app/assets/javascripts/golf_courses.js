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

GolfCourse.prototype.renderGolfCourseRounds = function() {
  return GolfCourse.golfCourseRoundsTemplate(this)
}

GolfCourse.getGolfCourseRoundsError = function(response) {
  console.log("Get gc rounds is busted!", response)
}

GolfCourse.getGolfCourseRoundsSuccess = function(golfCourseJson) {
  var golfCourse = new GolfCourse(golfCourseJson);
  var id = golfCourse.id
  var showCourseRounds = golfCourse.renderGolfCourseRounds()
  $(`#all-rounds-gc-${id}`).html(showCourseRounds)
}

// GolfCourse.enablePostRound = function() {
//   $(".gc-post-round").disabled = false;
//   $(".btn-primary.post-round").disabled = false;
//   GolfCourse.postRoundListener()
// }

GolfCourse.postGolfCourseRoundFail = function(response) {
  $("#roundBlank").text("Uh, what was your score?")
  console.log("Post round is busted!", response)
}

GolfCourse.postGolfCourseRoundDone = function(roundJson) {
  $('#round_score').val('');
  var round = new Round(roundJson);
  var showRound = round.renderGolfCourseRound()
  var golfCourseId = round.golf_course_id;
  $(`#all-rounds-gc-${golfCourseId}`).html(showRound)
  console.log(round)
  $("#post-round").attr("disabled", false);
}

GolfCourse.getGolfCourseRounds = function(id) {
  $.get("/golf_courses/" + id + ".json")
    .success(function(rounds) {
      if ($.trim(rounds)) {
        GolfCourse.getGolfCourseRoundsSuccess(rounds)
        console.log(rounds);
      } else {
        alert("No Rounds Posted")
      }
    })
    .error(GolfCourse.getGolfCourseRoundsError)
}

GolfCourse.submitGolfCourseRound = function(roundValues, id) {
  var postRound = $.post("/golf_courses/" + id + "/rounds", roundValues)
  .done(GolfCourse.postGolfCourseRoundDone)
  .fail(GolfCourse.postGolfCourseRoundFail)
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
    var roundValues = $(this).serialize();
    var id = $("#round_golf_course_id").val();
    // var golfer_id = $("#round_golfer_id").val()
    // var score = $("#round_score").val()
    GolfCourse.submitGolfCourseRound(roundValues, id)
  });
}

GolfCourse.ready = function() {
  GolfCourse.showRoundsListener()
  GolfCourse.postRoundListener()
  // select template html
  GolfCourse.golfCourseRoundsHandlebars = $("#golf-course-rounds-template").html();
  GolfCourse.showRoundHandlebars = $("#gc-show-round-template").html();

  GolfCourse.golfCourseRoundsTemplate = Handlebars.compile(GolfCourse.golfCourseRoundsHandlebars);
  GolfCourse.showRoundTemplate = Handlebars.compile(GolfCourse.showRoundHandlebars);

}

  // var currentGolferId = $("#golf-course-rounds-template").data("id")
  // Handlebars.registerHelper('ifequalCourseId',function(a, options) {
  //   if (a === currentGolferId) {
  //     return options.fn(this);
  //   } else {
  //     return options.inverse(this);
  //   }


  $(".golf_course.show").ready(function() {
    if ($(".btn-info.show-rounds").length > 0) {
      GolfCourse.ready()
    }
  });

  Handlebars.registerHelper("log", function(something) {
  console.log(something);
});

  // post new round for golf_course on it's show page
  // $(".golf_courses.show").ready(function() {
  //   $(".post-round").on("submit", function(e) {
  //     e.preventDefault();
  //     var values = $(this).serialize();
  //     var newRound = $.post(this.action + ".json", values);
  //     newRound.done(function(round) {
  //       $("#round_score").val("");
  //       $("#showPostedRound").text(`Successfully entered score of ${round.score} by ${round.golfer.name}`);
  //       $("#roundBlank").text("")
  //     })
  //     .fail(function() {
  //       $("#roundBlank").text("Uh, what was your score?")
  //       $('.post-round').find("input[type=submit]").removeAttr('disabled');
  //     });
  //   });
  // });

  // post new comment on golf_course show page
  $(".golf_courses.show").ready(function() {
    $('.post-comment').on("submit", function(e) {
      e.preventDefault();
      var values = $(this).serialize();
      var postComment = $.post(this.action + ".json", values)
      postComment.done(function(comment) {
        $("#golf_course_comment_content").val("");
        $('.post-comment').find("input[type=submit]").removeAttr('disabled');
        if ($.trim(comment)) {
          $(".golf-course-comments").append(`<li>${comment["content"]} - by ${comment["golfer"]["name"]} on ${formatDate(new Date(comment["created_at"]))}`);
          $("#duplicate-comment").text('');
        } else {
          $("#duplicate-comment").text("That's already been said about this course, be original ;)")
        }
      });
    });
  });
