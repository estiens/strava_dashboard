$ ->
  $("#details").hide()
  old = []
  polylines = []

  onMouseover = (e) ->
    old = this.options
    this.setStyle({'color': '#333333','weight': 4,'opacity': .9})

  onMouseout = (e) ->
    this.setStyle(old)

  $(document).on('mouseenter', '#legend li', ->
    $('.rideline').hide()
    name = $(@).attr('id').replace(/\s+/g, '').toLowerCase().replace(/-/g,"")
    name = '.' + name
    $(name).show()
  )

  $(document).on('mouseleave', '#legend li', ->
    $('.rideline').show()
  )

  get_rider_details = (url, ridercolor) ->
    $.ajax
      url: url + ".json",
      success: (data, textStatus, jqXHR) ->
        $("#details").show().css("background-color", ridercolor)
        textcolor = if Spectra(ridercolor).isLight() then "black" else "white"
        $("#detailbox").html("BIKER: #{data.ride.biker}<br>DISTANCE: #{data.ride.distance} miles<br>AVERAGE SPEED: #{data.ride.avg_speed} mph").css("color", "white")

  L.mapbox.accessToken = 'pk.eyJ1Ijoic3RyYXZhLXNmZyIsImEiOiJEQ1k0NTRnIn0.I8b4f52DpWDhfCfDbnq5Rg';
  map = L.mapbox.map('map', 'strava-sfg.jcbid1nm')
    .setView([44.96, -93.29], 12);

  array_colors = ["rgb(255, 179, 0)",
                  "rgb(128, 62, 117)",
                  "rgb(255, 104, 0)",
                  "rgb(193, 0, 32)",
                  "rgb(206, 162, 98)",
                  "rgb(129, 112, 102)",
                  "rgb(0, 125, 52)",
                  "rgb(246, 118, 142)",
                  "rgb(0, 83, 138)",
                  "rgb(255, 122, 92)",
                  "rgb(83, 55, 122)",
                  "rgb(255, 142, 0)",
                  "rgb(179, 40, 81)",
                  "rgb(244, 200, 0)",
                  "rgb(127, 24, 13)",
                  "rgb(147, 170, 0)",
                  "rgb(89, 51, 21)",
                  "rgb(241, 58, 19)",
                  "rgb(35, 44, 22))"
                  ]

  i = 0
  for biker in gon.bikers
    color = array_colors[i] or Spectra.random()
    color = Spectra(color)
    i += 1
    $('#legend').append( "<li id='#{biker.name}' style='color:#{color}'> #{biker.name}<br>#{biker.this_week_distance}mi </li>" )
    for ridehash in biker.lat_lngs
      for ride_id, coordinates of ridehash
        polyline = L.polyline(coordinates,{color: color, opacity: 0.8, weight: 2, classname: ride_id+color}).on('mouseover', onMouseover).on('mouseout', onMouseout).addTo(map);
        polyline._path.setAttribute('class', "#{biker.name.replace(/\s+/g, '').toLowerCase()} rideline");
        polylines.push(polyline);
  for polyline in polylines
    $(polyline).mouseenter ->
      rideid = this.options.classname
      ridercolor = /([#]......)/.exec(this.options.classname)[0]
      get_rider_details("/rides/#{rideid}", ridercolor)
    $(polyline).mouseleave ->
      $("#details").hide()




