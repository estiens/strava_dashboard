$ ->
  map = L.map('map').setView([44.96, -93.29], 13);

  L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
    maxZoom: 18
  }).addTo(map);

  lat_lngs = []
  for array in gon.rides
    colors = ["red","blue", "green"]
    color = _.sample(colors)
    polyline = L.polyline(array,{color: 'black', opacity: 0.4, dashArray: "5, 1"}).addTo(map);
    for lat_lng in array
      lat_lngs.push(lat_lng)

  # heat = L.heatLayer(lat_lngs, {blur: 25, radius: 20}).addTo(map);
