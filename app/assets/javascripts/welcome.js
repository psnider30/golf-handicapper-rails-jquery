var home = { groupSize: null, lowIndexGolfer: null, lowRound: null,
  lowRoundNet: null, lowSlopeCourse: null, highSlopeCourse: null };

$(".welcome.home").ready(function() {
  var loggedIn = $(".not-logged-in").length === 0;
  var homePage = $('.welcome-home').length > 0
  if (loggedIn && homePage) {
    getHomeInfo()
  }
});

function getHomeInfo() {
  $.get("/golf_courses.json")
    .done(doneGetGolfCourses)
    .fail(function(response) {
      console.log(response)
    });

  $.get("/golfers.json")
  .done(doneGetGolfers)
  .fail(function(response) {
    console.log(response)
  });
}

function doneGetGolfers(golfersJson) {
  var golfers = golfersJson.map(golfer => new Golfer(golfer));
  makeGolfersHome(golfers)
  var showHomeInfo = renderHomeInfo(home)
  $('.home-info').html(showHomeInfo)
}

function doneGetGolfCourses(gcJson) {
  var golfCourses = gcJson.map(gc => new GolfCourse(gc));
  makeGolfCoursesHome(golfCourses)
}

function makeGolfCoursesHome(golfCourses) {
  home.lowSlopeCourse = golfCourses.reduce((prev, current) => {
    return prev.course_slope < current.course_slope ? prev : current
  });
  home.highSlopeCourse = golfCourses.reduce((prev, current) => {
    return prev.course_slope > current.course_slope ? prev : current
  });
}

function makeGolfersHome(golfers) {
  home.groupSize = golfers.length;
  home.lowIndexGolfer = golfers.reduce((prev, current) => {
    return prev.golfer_index < current.golfer_index ? prev : current
  });
  var roundsRaw = golfers.map(golfer => golfer.rounds);
  var rounds = [].concat.apply([], roundsRaw);
  home.lowRound = rounds.reduce((prev, current) => {
    return prev.from_par < current.from_par ? prev : current
  });
  home.lowRoundNet = rounds.reduce((prev, current) => {
    return prev.net_from_par < current.net_from_par ? prev : current
  });
}

function renderHomeInfo(home) {
  var homeInfoHandlebars = $("#home-info-template").html()
  var homeInfoTemplate = Handlebars.compile(homeInfoHandlebars)
  return homeInfoTemplate(home)
}
