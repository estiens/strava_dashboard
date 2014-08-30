$ ->
  L.mapbox.accessToken = 'pk.eyJ1Ijoic3RyYXZhLXNmZyIsImEiOiJEQ1k0NTRnIn0.I8b4f52DpWDhfCfDbnq5Rg';
  map = L.mapbox.map('map', 'strava-sfg.jcbid1nm')
    .setView([44.96, -93.29], 12);
  # map = L.map('map').setView([44.96, -93.29], 13);

  # L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  #   attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
  #   maxZoom: 18
  # }).addTo(map);

  lat_lngs = []
  array_colors = ['yellow','purple','red','green','black']
  for k,v of gon.rides
    color = _.shuffle(array_colors).pop()
    console.log color
    $('#legend').append( "<li style='color:#{color}'> #{k} </li>" )
    colors = ['red','blue','green','black']
    for array in v
      polyline = L.polyline(array,{color: color, opacity: 0.4, weight: 2}).addTo(map);
