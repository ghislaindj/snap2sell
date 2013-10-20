@app.factory 'Geocoder', ($q, $http, $timeout, Geolocation) ->
  class Geocoder
    geocode: (address) ->
      deferred = $q.defer()

      geocoder = new google.maps.Geocoder
      geocoder.geocode
        location: new google.maps.LatLng address.latitude, address.longitude
      , (data) ->
        deferred.resolve data

      deferred.promise

    current_location: =>
      deferred = $q.defer()

      pos = Geolocation.get()

      if pos?
        @geocode(pos)
        .then (geocode) ->
          deferred.resolve(geocode)
        , ->
          deferred.reject()
      else
        $timeout ->
          deferred.reject()
        , 10

      deferred.promise

  new Geocoder
