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
  for array in gon.rides
    colors = ["red","blue", "green"]
    color = _.sample(colors)
    polyline = L.polyline(array,{color: "black", opacity: 0.4, weight: 2}).addTo(map);
    for lat_lng in array
      lat_lngs.push(lat_lng)

  # heat = L.heatLayer(lat_lngs, {blur: 25, radius: 20}).addTo(map);
