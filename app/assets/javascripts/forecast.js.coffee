$ ->
  $.get "http://api.openweathermap.org/data/2.5/forecast/daily?q=medellin&units=metric&cnt=6", (data) ->
    setActualDate data.list[0]
    setWeeklyDate data.list

  # Set actual date forecast information
  setActualDate = (day) ->
    $("#actual-day-temp").html day.temp.day
    $("#actual-day-date").html(getFormattedDate(day.dt))

  # Set weekly forecast information
  setWeeklyDate = (date_list) ->
    for position in [1..5]
      forcaste_id = "#forecast_week_" + position
      day = date_list[position]
      $(forcaste_id + " .forecast-week-date").html getFormattedDate day.dt
      $(forcaste_id + " .forecast-temperature span").html day.temp.day
      $(forcaste_id + " i img").attr "src",  "/assets/" + setForecastImage(day)
    return

  # Formats a given unix time stamp. ie: Sab 1/6
  getFormattedDate = (unixstamp) ->
    date = new Date(unixstamp * 1000)
    day_name = []
    fdata = ""
    day_name[0]=  "Dom";
    day_name[1] = "Lun";
    day_name[2] = "Mar";
    day_name[3] = "Mier";
    day_name[4] = "Jue";
    day_name[5] = "Vie";
    day_name[6] = "Sab";
    fdate = day_name[date.getDay()] + " " + date.getDate() + "/" + (date.getMonth() + 1)
    return fdate

  # Set forecast image for the week
  setForecastImage = (day) ->
    condition = day.weather[0].main
    console.log condition
    image = ""
    if condition == "sky is clear"
      image = "sun_icon2.png"
    else if condition == "few clouds" || condition == "scattered clouds" || condition == "broken clouds"
      image = "sun_icon1.png"
    else
      image = "clouds.png"
    return image
