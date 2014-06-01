$ ->
  plant_id = $("#plant_id").data('id')
  $("#water_btn").click =>
    plant_id = $("#plant_id").data('id')
    $.post plant_id + "/water"
  $("#heat_btn").click =>
    $.post plant_id + "/heat"
