Wine = function(id, name, vintage, rating, purchase_date) {
  this.id = id;
  this.name = name;
  this.vintage = vintage;
  this.rating = rating;
  this.purchase_date = purchase_date;

};


$(function() {
  id = $('.wineInfo').data('id');
  $.getJSON('/wines/' + id + '.json', function(data) {

    var wineText;
    wine = new Wine(data.id, data.name, data.vintage, data.ratings[0]["star"], data.users_wines[0]["purchase_date"])
    wineText = '<th scope="row">' + wine.id + '</th>';
    wineText += '<td>' + wine.name+ '</td>';
    wineText += '<td>' + wine.vintage + '</td>';
    wineText += '<td>' + wine.rating + '</td>';
    wineText += '<td>' + wine.niceDate() + '</td>';


    console.log(data)
    return $('.wineInfo').prepend(wineText);
    //return $(wineText).insertAfter( ".wineInfo" );
    //.insertAfter
  });
});




Wine.prototype.niceDate = function() {
  //console.log(this.purchase_date)
  //d = Date.parse(this.purchase_date)
  console.log(this.purchase_date)
  return moment(this.purchase_date).format('ll');
  //var currentDate = new Date(this.purchase_date);
  //return Date.parse(this.purchase_date).toLocaleDateString();
  //var date = currentDate.getDate();
  //var month = currentDate.getMonth(); //Be careful! January is 0 not 1
  //var year = currentDate.getFullYear();
  //var dateString = date + "-" +(month + 1) + "-" + year;
  //return currentDate.to_s;
};
