# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


setupBlacklistForm = ->
  $('#blacklist_klass_id').select2()
  return
#$ ->
#  $("body").on "click", ".panel" , (event) ->
#    alert("clicked");
#    $('.tabs-content').show();
#    $('.content').show();

setupButtonClick = ->
  $("body").on "click", "#panel" , (event) ->
    $('.first-panel-content').show();
    $('.second-panel-content').hide();
    $('.third-panel-content').hide();
    $('.fourth-panel-content').hide();
    $('.fifth-panel-content').hide();
    $('.sixth-panel-content').hide();
    $('.seventh-panel-content').hide();

  $("body").on "click", "#first-panel" , (event) ->
    $('.first-panel-content').hide();
    $('.second-panel-content').show();
    $('.third-panel-content').hide();
    $('.fourth-panel-content').hide();
    $('.fifth-panel-content').hide();
    $('.sixth-panel-content').hide();
    $('.seventh-panel-content').hide();

  $("body").on "click", "#second-panel" , (event) ->
    $('.first-panel-content').hide();
    $('.second-panel-content').hide();
    $('.third-panel-content').show();
    $('.fourth-panel-content').hide();
    $('.fifth-panel-content').hide();
    $('.sixth-panel-content').hide();
    $('.seventh-panel-content').hide();


  $("body").on "click", "#third-panel" , (event) ->
    $('.first-panel-content').hide();
    $('.second-panel-content').hide();
    $('.third-panel-content').hide();
    $('.fourth-panel-content').show();
    $('.fifth-panel-content').hide();
    $('.sixth-panel-content').hide();
    $('.seventh-panel-content').hide();

  $("body").on "click", "#fourth-panel" , (event) ->
    $('.first-panel-content').hide();
    $('.second-panel-content').hide();
    $('.third-panel-content').hide();
    $('.fourth-panel-content').hide();
    $('.fifth-panel-content').show();
    $('.sixth-panel-content').hide();
    $('.seventh-panel-content').hide();


  $("body").on "click", "#fifth-panel" , (event) ->
    $('.first-panel-content').hide();
    $('.second-panel-content').hide();
    $('.third-panel-content').hide();
    $('.fourth-panel-content').hide();
    $('.fifth-panel-content').hide();
    $('.sixth-panel-content').show();
    $('.seventh-panel-content').hide();


  $("body").on "click", "#sixth-panel" , (event) ->
    $('.first-panel-content').hide();
    $('.second-panel-content').hide();
    $('.third-panel-content').hide();
    $('.fourth-panel-content').hide();
    $('.fifth-panel-content').hide();
    $('.sixth-panel-content').hide();
    $('.seventh-panel-content').show();



#    $('.content').show();

$(document).ready setupBlacklistForm
$(document).ready setupButtonClick
$(document).on 'page:load', setupBlacklistForm
