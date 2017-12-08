function formatDate(fullDate) {
  var day = fullDate.getDate();
  if(day <=9) { day = '0' + day}
  var month = fullDate.getMonth() + 1;
  if(month <=9) { month = '0' + month}
  var year = fullDate.getFullYear();
  return `${month}/${day}/${year}`
}
