@app.factory 'Geolocation', ($q, $timeout) ->
  last_position = null

  navigator.geolocation.watchPosition (geoposition) ->
    last_position = geoposition.coords
  , ->
    console.log 'GPS ERROR'
  ,
    enableHighAccuracy: false
    timeout:            120000
    maximumAge:         1800000 # 0.5h

  get: ->
    last_position if last_position?
