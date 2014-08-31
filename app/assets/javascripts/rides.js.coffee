$ ->
  $("#details").hide()

  highlight = {
    'color': '#333333',
    'weight': 4,
    'opacity': .9
  };

  old = []

  onMouseover = (e) ->
    old = this.options
    this.setStyle(highlight)

  onMouseout = (e) ->
    this.setStyle(old)

  get_json = (url) ->
    $.ajax
      async: "false",
      dataType: "json",
      url: url + ".json",
      success: (data, textStatus, jqXHR) ->
        $("#details").show()
        $("#detailbox").html("BIKER: #{data.ride.biker}<br>DISTANCE: #{data.ride.distance} miles<br>AVERAGE SPEED: #{data.ride.avg_speed} mph")

  L.mapbox.accessToken = 'pk.eyJ1Ijoic3RyYXZhLXNmZyIsImEiOiJEQ1k0NTRnIn0.I8b4f52DpWDhfCfDbnq5Rg';
  map = L.mapbox.map('map', 'strava-sfg.jcbid1nm')
    .setView([44.96, -93.29], 12);
  # map = L.map('map').setView([44.96, -93.29], 13);

  # L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  #   attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
  #   maxZoom: 18
  # }).addTo(map);

  array_colors = ['#008CBA','#f04124', '#43AC6A', '#f08a24']
  polylines = []
  _.shuffle(array_colors)
  for name,rides of gon.rides
    color = array_colors.pop()
    $('#legend').append( "<li style='color:#{color}'> -#{name}- </li>" )
    for ridehash in rides
      for ride_id, coordinates of ridehash
        polyline = L.polyline(coordinates,{color: color, opacity: 0.8, weight: 2, classname: ride_id}).on('mouseover', onMouseover).on('mouseout', onMouseout).addTo(map);
        polylines.push(polyline)
  for polyline in polylines
    $(polyline).mouseenter ->
      rideid = this.options.classname
      get_json("/rides/#{rideid}")
    $(polyline).mouseleave ->
      $("#details").hide()




