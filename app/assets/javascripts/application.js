// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap/bootstrap-tooltip
// require turbolinks
//= require_tree .

jQuery.fn.selectText = function() {
  var range, selection;
  return this.each(function() {
    if (document.body.createTextRange) {
      range = document.body.createTextRange();
      range.moveToElementText(this);
      range.select();
    } else if (window.getSelection) {
      selection = window.getSelection();
      range = document.createRange();
      range.selectNodeContents(this);
      selection.removeAllRanges();
      selection.addRange(range);
    }
  });
};

function copyFormToContent(from, to){
    var content = $(from).val();
    if(!content){
        content = $(from).attr('placeholder');
    }
    $(to).html(content);
}

function copyContentToForm(from, to){
    var content = $(from).text();
    $(to).val(content);
}
function copyForm(){
	    copyContentToForm('#name1', "#rsvp_name1")
	    copyContentToForm('#name2', "#rsvp_name2")
}
function initTooltips(){
  $(".my-tooltip").tooltip();
}

function init(){
    copyFormToContent('#rsvp_name1', '#name1')
    copyFormToContent('#rsvp_name2', '#name2')
    $(".name-input").focus(function(){
        $(this).selectText();
    })
    $(".name-input").focusout(function(){
        copyForm();
    })
	initTooltips();
}

$(init);
