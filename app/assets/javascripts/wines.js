var app = window.app = {};

app.Wines = function() {
  this._input = $('#wine-name');
  this._initAutocomplete();
};

app.Wines.prototype = {

};

_initAutocomplete: function() {
  this._input
    .autocomplete({
      source: '/wines',
      appendTo: '#wine-name',
      select: $.proxy(this._select, this)
    })
    .autocomplete('instance')._renderItem = $.proxy(this._render, this);
}

_select: function(e, ui) {
  this._input.val(ui.item.name);
  return false;
}

_render: function(ul, item) {
  var markup = [
    '<span class="name">' + item.name + '</span>'
  ];
  return $('<li>')
    .append(markup.join(''))
    .appendTo(ul);
}
