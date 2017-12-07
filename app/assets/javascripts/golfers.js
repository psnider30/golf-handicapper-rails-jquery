function Golfer(attributes) {
  this.id = attributes.id;
  this.name = attributes.name;
  this.email = attributes.email
  this.golfer_index = attributes.golfer_index
  this.rounds = attributes.rounds
}

Golfer.success = function(json) {
  var golfer = new Golfer(json);
  // var showGolfer = golfer.renderGolfer;
  console.log(golfer);
}

Golfer.error = function(response) {
  console.log("Not working?", response)
}

Golfer.prototype.renderGolfer = function() {

}

Golfer.nextListener = function() {
  var $next = $(".btn-primary.next-golfer")
  var nextId = parseInt($next.attr("data-id")) + 1;
  $next.click( function() {
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
  // select template html
  // compile handlesbars temmplate
  Golfer.nextListener()
}

$(".golfers.show").ready(function() {
  Golfer.ready()
});
