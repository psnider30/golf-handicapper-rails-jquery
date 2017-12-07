function Golfer(attributes) {
  this.id = attributes.id;
  this.name = attributes.name;
  this.email = attributes.email
}

Golfer.prototype.renderGolfer = function() {
  
}

$(".golfers.show").ready(function() {
  var golfer;
  var $next = $(".btn-primary.next-golfer")
  $next.on("click", function() {
    var nextId = parseInt($next.attr("data-id")) + 1;
    $.get("/golfers/" + nextId + ".json", function(data) {
      golfer = data;
      getGolfer(golfer);
    });
  });
});

function getGolfer(golfer) {
  return golfer;
}
