'use strict'

@app.controller 'NewProductCtrl', ($scope, NewProduct, Product, User, $http, $location, Geocoder) ->
  $scope.product = NewProduct.get()
  $scope.product.user = User.get(id: "current")
  console.log $scope.product.user

  reader = new FileReader
  reader.onload = (event) ->
    $scope.productPictureUrl = event.target.result
    $scope.$apply()
  reader.readAsDataURL $scope.product.picture


  send = (location) ->
    $scope.product.location = location if location

    fd = new FormData
    fd.append 'product[picture]',     $scope.product.picture
    fd.append 'product[title]',       $scope.product.title
    fd.append 'product[location]',    $scope.product.location   if location
    fd.append 'product[user][email]', $scope.product.user.email

    # Custom $http POST to support file upload
    $http.post '/products.json', fd,
      withCredentials: true,
      headers: {'Content-Type': undefined },
      transformRequest: angular.identity
    .success (data) ->
      $location.path "/products/#{data.id}"
    .error ->
      console.log "ERROR"

  $scope.create = ->

    Geocoder.current_location()
    .then (geocode) ->
      location = JSON.stringify geocode[0]
      send(location)
    , ->
      send()
