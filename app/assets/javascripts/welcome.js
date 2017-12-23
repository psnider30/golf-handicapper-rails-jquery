var home = { groupSize: null, lowIndexGolfer: null, lowRound: null,
  lowRoundNet: null, lowSlopeCourse: null, highSlopeCourse: null };

$(".welcome.home").ready(function() {
  hideIfBlank()
  var loggedIn = $(".not-logged-in").length === 0;
  var homePage = $('.welcome-golfer').length > 0
  if (loggedIn && homePage) {
    getHomeInfo()
  }
});

function hideIfBlank() {
  $loginNotice = $('.login-notice')
  if ($loginNotice.text() === '') {
    $loginNotice.css("visibility", "hidden")
  }

  $homeInfo = $('.home-info')
  $welcome = $('.welcome-golfer h1')
  if ($welcome.text().split(' ').length === 1) {
    $homeInfo.css("visibility", "hidden")
  }
}

function getHomeInfo() {
  var golferRequest = $.get("/golfers.json")
  .fail(function(response) {
    console.log(response)
  });

  var golfCourseRequest = $.get("/golf_courses.json")
    .fail(function(response) {
      console.log(response)
    });

  homeInfoRequestsDone(golferRequest, golfCourseRequest)
}

function homeInfoRequestsDone(golferRequest, golfCourseRequest) {
  $.when(golferRequest, golfCourseRequest).then(function(golfersJson, gcJson) {
    // var golfers = golfersJson.map(golfer => new Golfer(golfer));
    // var golfCourses = gcJson.map(gc => new GolfCourse(gc));
    console.log(golfersJson)
    makeGolfersHome(golfersJson, gcJson)
  });

}

function makeGolfersHome(golfersJson, gcJson) {
  var golfers = golfersJson[0];
  var golfCourses = gcJson[0];
  
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
  home.lowSlopeCourse = golfCourses.reduce((prev, current) => {
    return prev.course_slope < current.course_slope ? prev : current
  });
  home.highSlopeCourse = golfCourses.reduce((prev, current) => {
    return prev.course_slope > current.course_slope ? prev : current
  });

  var showHomeInfo = renderHomeInfo(home);
  $('.home-info').html(showHomeInfo)
}

function renderHomeInfo(home) {
  var homeInfoHandlebars = $("#home-info-template").html()
  var homeInfoTemplate = Handlebars.compile(homeInfoHandlebars)
  return homeInfoTemplate(home)
}
