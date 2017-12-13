function Golfer(attributes) {
  this.id = attributes.id;
  this.name = attributes.name;
  this.email = attributes.email;
  this.golfer_index = attributes.golfer_index;
  this.rounds = attributes.rounds;
  this.course_most_played = attributes.course_most_played;
}

$(".golfers.show").ready(function() {
  if ($(".btn-primary.next-golfer").length > 0) {
    Golfer.ready()
  }
});

Golfer.ready = function() {
  Golfer.nextListener()
  // select template html
  Golfer.golferHandlebars = $("#golfer-template").html()

  var currentGolferId = $("#golfer-rounds-template").data("id")
  Handlebars.registerHelper('ifPermissionGolfer',function(a, options) {
    if (a === currentGolferId) {
      return options.fn(this);
    } else {
      return options.inverse(this);
    }
  });

  Golfer.roundsHandlebars = $("#golfer-rounds-template").html()
  // compile handlesbars temmplate
  Golfer.golferTemplate = Handlebars.compile(Golfer.golferHandlebars)
  Golfer.roundsTemplate = Handlebars.compile(Golfer.roundsHandlebars)
}

Golfer.nextListener = function() {
  $next = $(".btn-primary.next-golfer");
  $next.on('click', function() {
    var nextId = parseInt($next.data("id")) + 1;
    var lastGolferId = $next.data("last-golfer-id")
    if (nextId > lastGolferId) {
      nextId = $next.data("first-golfer-id");
    }
    $next.data("id", nextId);
    Golfer.getNextGolfer(nextId);
  });
}

Golfer.getNextGolfer = function(nextId) {
  $.get("/golfers/" + nextId + ".json", function(golfer) {
  })
  .success(Golfer.successGetNext)
  .error(Golfer.errorGetNext)
}

Golfer.successGetNext = function(golferJson) {
  var golfer = new Golfer(golferJson);
  var showGolfer = golfer.renderGolfer()
  var showRounds = golfer.renderRounds()

  // add or append the html from showGolfer
  $(".golfer-info").html(showGolfer)
  $(".golfer-rounds").html(showRounds)
  console.log(golfer);
}

Golfer.errorGetNext = function(response) {
  console.log("Not working?", response)
}

Golfer.prototype.renderGolfer = function() {
  return Golfer.golferTemplate(this)
}

Golfer.prototype.renderRounds = function() {
  return Golfer.roundsTemplate(this)
}
