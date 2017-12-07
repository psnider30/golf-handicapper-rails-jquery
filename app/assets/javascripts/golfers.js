$(".golfers.show").ready(function() {
  var $next = $(".btn-primary.next-golfer")
  $next.on("click", function() {
    var nextId = parseInt($next.attr("data-id")) + 1;
    $.get("/golfers/" + nextId + ".json", function(golfer) {
      console.log(golfer);
    });
  });
});
