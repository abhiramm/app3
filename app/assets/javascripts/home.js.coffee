# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  performer_delivery = ->
      performer = $('#order_performer_id :selected').text()
      options_performer = $(deliveries).filter("optgroup[label='#{performer}']").html()
      select_option = '<option value="">Please select an option</option>\n'
      options_performer = select_option + options_performer
      if options_performer
        $('#order_delivery_time_id').html(options_performer)
      else
        $('#order_delivery_time_id').empty()

  performer_quality = ->
      performer = $('#order_performer_id :selected').text()
      options_performer = $(qualities).filter("optgroup[label='#{performer}']").html()
      select_option = '<option value="">Please select an option</option>\n'
      options_performer = select_option + options_performer
      if options_performer
        $('#order_quality_id').html(options_performer)
      else
        $('#order_quality_id').empty()

  performer_duration = ->
      performer = $('#order_performer_id :selected').text()
      options_performer = $(durations).filter("optgroup[label='#{performer}']").html()
      select_option = '<option value="">Please select an option</option>\n'
      options_performer = select_option + options_performer
      if options_performer
        $('#order_duration_id').html(options_performer)
      else
        $('#order_duration_id').empty()

  performer_category = ->
      performer = $('#order_performer_id :selected').text()
      categoreee = $(categories).html()
      options_performer = $(categories).filter("optgroup[label='#{performer}']").html()
      select_option = '<option value="">Please select an option</option>\n'
      options_performer = select_option + options_performer
      console.log options_performer
      if options_performer
        $('#order_clip_category_id').html(options_performer)
      else
        $('#order_clip_category_id').empty()

  performer_change = ->
    performer_category()
    performer_duration()
    performer_quality()
    performer_delivery()

  location_change = ->
    $('#order_location_id').change ->
      country = $('#order_location_id :selected').text()
      options = $(performers).filter("optgroup[label='#{country}']").html()
      select_option = '<option value="">Please select an option</option>\n'
      options = select_option + options
      if options
        $('#order_performer_id').html(options)
        performer_change()

      else
        $('#order_performer_id').empty()


  performers = $('#order_performer_id').html()
  categories = $('#order_clip_category_id').html()
  durations  = $('#order_duration_id').html()
  qualities  = $('#order_quality_id').html()
  deliveries = $('#order_delivery_time_id').html()

  location_change()

  $('#order_performer_id').change ->
    performer_change()
    console.log "before ajax"
    console.log $("#order_performer_id option:selected").val()
    $.ajax
      url: "get_image"
      type: "GET"
      data:
        performer_id: $("#order_performer_id option:selected").val()
    console.log "hi"
