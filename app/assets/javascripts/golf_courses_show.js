function formatDate(fullDate) {
  var day = fullDate.getDate();
  if(day <=9) { day = '0' + day}
  var month = fullDate.getMonth() + 1 ;
  var year = fullDate.getFullYear();
  return `${month}/${day}/${year}`
}

// show all the rounds for golf_course on show page
$(".golf_courses.show").ready(function() {
  $(".show-rounds").on("click", function(e) {
    e.preventDefault();
    var id = $(this).data("id");
    $.get("/golf_courses/" + id + "/rounds.json").success(function(data) {
      if (!$.trim(data)) {
        alert("No Rounds Posted")
      } else {
        var rounds = data;
        var roundsList = '';
        rounds.forEach(function(round) {
          roundsList += `<li> ${round.golfer.name}` + ' - ' +
          `${round.score}` + ' - ' +
          `${round.display_from_par}` + ' - ' +
          `${formatDate(new Date(round.created_at))} </li>`;
        });
        $("#all-rounds-gc-" + id).html(roundsList);
      }
    });
  });
});

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
