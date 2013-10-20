@app.factory 'Geocoder', ($q, $http, Geolocation) ->
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

      Geolocation.get()
      .then (position) =>
        @geocode(position)
        .then (geocode) ->
          deferred.resolve(geocode)

      deferred.promise

  new Geocoder
