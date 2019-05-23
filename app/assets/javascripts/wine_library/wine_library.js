Wine = function(id, name, vintage, rating) {
  this.id = id;
  this.name = name;
  this.vintage = vintage;
  this.ratings = rating;

};



  //id = $('.wineInfo').data('id');

  $(".wines.wine_library").ready(function() {
  $.getJSON('/wines/library.json', function(data) {

    data.forEach(row => {
      //console.log(f)

      let wineText;
      wine = new Wine(row.id, row.name, row.vintage, row.ratings)
      console.log(wine)

      wineText = '<tr>';
      wineText += '<th scope="row">' + wine.id + '</th>';
      wineText += '<td>' + wine.name+ '</td>';
      wineText += '<td>' + wine.vintage + '</td>';

      let all_ratings = []
      if (typeof wine.rating !== undefined ) {
        wine.rating.forEach(rating => {
          all_ratings.push(rating.star + ", ")
        });

      }

      wineText += '<td>' + all_ratings+ '</td>';
      wineText += '</tr>';



      //console.log(data)
    $('tbody').append(wineText);


    });
    //console.log(data)


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

Wine.prototype.ratingString = function() {
  //console.log(this.purchase_date)
  //d = Date.parse(this.purchase_date)
return typeof this.wine.ratings == undefined ? "0 Ratings." : this.wine.ratings;

  //return this.data.ratings.join(" ,");
  //var currentDate = new Date(this.purchase_date);
  //return Date.parse(this.purchase_date).toLocaleDateString();
  //var date = currentDate.getDate();
  //var month = currentDate.getMonth(); //Be careful! January is 0 not 1
  //var year = currentDate.getFullYear();
  //var dateString = date + "-" +(month + 1) + "-" + year;
  //return currentDate.to_s;
};
