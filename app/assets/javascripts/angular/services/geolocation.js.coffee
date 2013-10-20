@app.factory 'Geolocation', ($q) ->
  get: ->
    deferred = $q.defer()

    navigator.geolocation.getCurrentPosition (geoposition) ->
      deferred.resolve geoposition.coords
    , (error) ->
      console.log 'Error:' + error
    ,
      enableHighAccuracy: true
      timeout : 5000

    deferred.promise
