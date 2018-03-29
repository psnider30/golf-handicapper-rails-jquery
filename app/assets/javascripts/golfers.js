function Golfer(attributes) {
  this.id = attributes.id;
  this.name = attributes.name;
  this.email = attributes.email;
  this.golfer_index = attributes.golfer_index;
  if (attributes.rounds) { this.rounds = attributes.rounds.reverse(); }
  this.course_most_played = attributes.course_most_played;
}

$(".golfers.show").ready(function() {
  if ($(".btn-primary.next-golfer").length > 0) {
    Golfer.ready()
  }
});

Golfer.ready = function() {
  Golfer.getGolfersIds()
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

Golfer.getGolfersIds = function() {
  var golferRequest = $.get("/golfers.json")
    .fail(function(response) {
      console.log(response)
    })
    .done(Golfer.doneGetGolfersIds)
}

Golfer.doneGetGolfersIds = function(golfersJson) {
  var golfersIds = golfersJson.map(golfer => golfer.id);
  Golfer.nextListener(golfersIds)
}

Golfer.nextListener = function(golfersIds) {
  $next = $(".btn-primary.next-golfer");
  $next.on('click', function() {
    var nextId = parseInt($next.data("id")) + 1;
    var lastGolferId = $next.data("last-golfer-id")
    if (nextId > lastGolferId) {
      nextId = $next.data("first-golfer-id");
    }
    Golfer.checkNextId(nextId, golfersIds);
  });
}

Golfer.checkNextId = function(nextId, golfersIds) {
  if (golfersIds.includes(nextId)) {
    Golfer.getNextGolfer(nextId)
  } else {
    nextId += 1;
    Golfer.checkNextId(nextId, golfersIds)
  }
}

Golfer.getNextGolfer = function(nextId) {
  //update the id for the golfer in the next button if this function called
  $next.data("id", nextId);
  $.get("/golfers/" + nextId + ".json", function(golfer) {
  })
  .success(Golfer.successGetNext)
  .error(Golfer.errorGetNext)
}

Golfer.successGetNext = function(golferJson) {
  const golfer = new Golfer(golferJson);
  const showGolfer = golfer.renderGolfer()
  const showRounds = golfer.renderRounds()

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
