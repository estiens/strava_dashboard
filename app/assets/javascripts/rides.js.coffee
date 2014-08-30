$ ->
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

  L.mapbox.accessToken = 'pk.eyJ1Ijoic3RyYXZhLXNmZyIsImEiOiJEQ1k0NTRnIn0.I8b4f52DpWDhfCfDbnq5Rg';
  map = L.mapbox.map('map', 'strava-sfg.jcbid1nm')
    .setView([44.96, -93.29], 12);
  # map = L.map('map').setView([44.96, -93.29], 13);

  # L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  #   attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
  #   maxZoom: 18
  # }).addTo(map);

  lat_lngs = []
  array_colors = ['#008CBA','#f04124', '#43AC6A', '#f08a24']
  polylines = []
  _.shuffle(array_colors)
  for k,v of gon.rides
    color = array_colors.pop()
    $('#legend').append( "<li class=#{k[0..2]} style='color:#{color}'> -#{k}- </li>" )
    for array in v
      polyline = L.polyline(array,{color: color, opacity: 0.8, weight: 2, classname: k[0..2]}).on('mouseover', onMouseover).on('mouseout', onMouseout).addTo(map);
      polylines.push(polyline)

