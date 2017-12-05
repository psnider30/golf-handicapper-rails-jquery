
$(function() {
  $(".show-rounds").on("click", function(e) {
    e.preventDefault();
    var id = $(this).data("id");
    $.get("/golf_courses/" + id + "/rounds.json", function(data) {
      var rounds = data;
      var roundsList = '';
      rounds.forEach(function(round) {
        roundsList += `<li> ${round.golfer.name}` + ' - ' +
        `${round.score}` + ' - ' +
        `${round.display_from_par}` + ' - ' +
        `${formatDate(new Date(round.created_at))} </li>`;
      });
      $("#all-rounds-gc-" + id).html(roundsList);
    });
  });
});

function formatDate(fullDate) {
  var day = fullDate.getDate();
  var month = fullDate.getMonth() + 1 ;
  var year = fullDate.getFullYear();
  return `${day}/${month}/${year}`
}
