# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$('.catalog').replaceWith("<%= escape_javascript  render 'items' %> ")
$('#pagination').html('<%= escape_javascript(paginate(@items, :remote => true).to_s) %>');