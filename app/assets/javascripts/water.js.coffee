$ ->
  $("#water_btn").click ->
    plant_id = $("#plant_id").data('id')
    $.post plant_id + "/water"
