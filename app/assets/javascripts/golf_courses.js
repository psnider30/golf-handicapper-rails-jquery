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

// post new round for golf_course on it's show page
$(".golf_courses.show").ready(function() {
  $(".post-round").on("submit", function(e) {
    e.preventDefault();
    var values = $(this).serialize();
    var newRound = $.post(this.action + ".json", values);
    newRound.done(function(round) {
      $("#round_score").val("");
      $("#showPostedRound").text(`Successfully entered score of ${round.score} by ${round.golfer.name}`);
      $("#roundBlank").text("")
    })
    .fail(function() {
      $("#roundBlank").text("Uh, what was your score?")
      $('.post-round').find("input[type=submit]").removeAttr('disabled');
    });
  });
});

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

GolfCourse.error = function(response) {
  console.log("It's busted!", response)
}
// show all the rounds for golf_course on show page

    // $.get("/golf_courses/" + id + "/rounds.json").success(function(data) {
    //   if (!$.trim(data)) {
    //     alert("No Rounds Posted")
    //   } else {
    //     var rounds = data;
    //     var roundsList = '';
    //     rounds.forEach(function(round) {
    //       roundsList += `<li> ${round.golfer.name}` + ' - ' +
    //       `${round.score}` + ' - ' +
    //       `${round.display_from_par}` + ' - ' +
    //       `${round.created_at_simple} </li>`;
    //     });
    //     $("#all-rounds-gc-" + id).append(roundsList);
    //   }
    // });


GolfCourse.getGolfCourseRounds = function(id) {
  $.get("/golf_courses/" + id + "/rounds.json")
    .success(function(rounds) {
      if ($.trim(rounds)) {
        alert("I found Rounds");
        console.log(rounds);
      } else {
        alert("No Rounds Posted")
      }
    })
    .error(GolfCourse.error)
}

GolfCourse.showRoundsListener = function() {
  $showRounds = $(".btn-info.show-rounds");
  $showRounds.on("click", function(e) {
    e.preventDefault();
    var id = $(this).data("id");
    GolfCourse.getGolfCourseRounds(id)
  });
}

GolfCourse.ready = function() {
  GolfCourse.showRoundsListener()
  // select template html
  GolfCourse.golfCourseRoundsHandlebars = $("#golf-course-rounds-template").html()

  GolfCourse.golfCourseRoundsTemplate = Handlebars.compile(GolfCourse.golfCourseRoundsHandlebars)

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
