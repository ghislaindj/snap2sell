@app.factory 'Geolocation', ($q) ->
  get: ->
    deferred = $q.defer()

    navigator.geolocation.getCurrentPosition (geoposition) ->
      deferred.resolve geoposition.coords
    , (error) ->
      console.log error
    ,
      enableHighAccuracy: true
      timeout : 10000

    deferred.promise
