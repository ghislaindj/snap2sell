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
    deferred = $q.defer()

    return_last_position = ->
      if last_position?
        deferred.resolve last_position
      else
        $timeout return_last_position, 1000
    return_last_position()

    deferred.promise
