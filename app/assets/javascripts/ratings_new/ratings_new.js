

$(function () {
  $('form').submit(function(event) {
    //prevent form from submitting the default way
    event.preventDefault();
    //window.alert(this.action);

    var values = $(this).serialize();

    var posting = $.post(this.action, values);

    posting.done(function(data) {

      console.log(data)
      const newrating = $('.new_rating')

      let content = (`<br><div class="card">
        <div class="card-header">
          Successfully Added!
        </div>
        <div class="card-body">
          <h5 class="card-title">${data.wine.name}</h5>
          <p class="card-text">Notes: ${data.note}</p>
          <a href="#" class="btn btn-primary">Rating - ${data.star}/100</a>
        </div>
      </div>`);

     //  let newcontent = "<h1>" + data.note "</h2>";

    //  new_rating.append(content)

      var r = $(".new_rating").parent();
      r.append(content);

    });


  });
});
