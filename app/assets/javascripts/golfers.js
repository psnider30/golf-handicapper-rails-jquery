function Golfer(attributes) {
  this.id = attributes.id;
  this.name = attributes.name;
  this.email = attributes.email;
  this.golfer_index = attributes.golfer_index;
  this.rounds = attributes.rounds;
  this.course_most_played = attributes.course_most_played;
}

Golfer.success = function(golfer_json) {
  var golfer = new Golfer(golfer_json);
  var showGolfer = golfer.renderGolfer()
  var showRounds = golfer.renderRounds()

  // add or append the html from showGolfer
  $(".golfer-info").html(showGolfer)
  $(".golfer-rounds").html(showRounds)
  console.log(golfer);
}

Golfer.error = function(response) {
  console.log("Not working?", response)
}

Golfer.prototype.renderGolfer = function() {
  return Golfer.golferTemplate(this)
}

Golfer.prototype.renderRounds = function() {
  return Golfer.roundsTemplate(this)
}

Golfer.nextListener = function() {
  $next = $(".btn-primary.next-golfer");
  $next.on('click', function() {
    var nextId = parseInt($next.data("id")) + 1;
    $next.data("id", nextId);
    Golfer.getNext(nextId);
  });
}

Golfer.getNext = function(nextId) {
  $.get("/golfers/" + nextId + ".json", function(golfer) {
  })
  .success(Golfer.success)
  .error(Golfer.error)
}

Golfer.ready = function() {
  Golfer.nextListener()
  // select template html
  Golfer.golferHandlebars = $("#golfer-template").html()

  var currentGolferId = $("#rounds-template").data("id")
  Handlebars.registerHelper('ifequalId',function(a, options) {
    if (a === currentGolferId) {
      return options.fn(this);
    } else {
      return options.inverse(this);
    }
  });

  Golfer.roundsHandlebars = $("#rounds-template").html()
  // compile handlesbars temmplate
  Golfer.golferTemplate = Handlebars.compile(Golfer.golferHandlebars)
  Golfer.roundsTemplate = Handlebars.compile(Golfer.roundsHandlebars)
}

$(".golfers.show").ready(function() {
  if ($(".btn-primary.next-golfer").length > 0) {
    Golfer.ready()
  }
});
