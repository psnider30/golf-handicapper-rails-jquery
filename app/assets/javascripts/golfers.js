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

  // add or append the html from showGolfer
  $(".golfer-info").html(showGolfer)
  console.log(golfer);
}

Golfer.error = function(response) {
  console.log("Not working?", response)
}

Golfer.prototype.renderGolfer = function() {
  return Golfer.template(this)
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
  Golfer.templateSource = $("#golfer-template").html()
  // compile handlesbars temmplate
  Golfer.template = Handlebars.compile(Golfer.templateSource)
}

$(".golfers.show").ready(function() {
  Golfer.ready()
});
