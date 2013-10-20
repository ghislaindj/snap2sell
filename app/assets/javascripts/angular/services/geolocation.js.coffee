@app.factory 'Geolocation', ($q) ->
  get: ->
    deferred = $q.defer()

    navigator.geolocation.getCurrentPosition (geoposition) ->
      deferred.resolve geoposition.coords

    deferred.promise
