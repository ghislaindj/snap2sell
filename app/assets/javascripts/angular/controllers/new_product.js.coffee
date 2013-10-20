'use strict'

@app.controller 'NewProductCtrl', ($scope, NewProduct, Product, $http, $location, Geocoder) ->
  $scope.product = NewProduct.get()

  reader = new FileReader
  reader.onload = (event) ->
    $scope.productPictureUrl = event.target.result
    $scope.$apply()
  reader.readAsDataURL $scope.product.picture

  $scope.create = ->

    Geocoder.current_location()
    .then (geocode) ->
      $scope.product.location = JSON.stringify geocode[0]
      console.log $scope.product.location

      fd = new FormData
      fd.append 'product[picture]',     $scope.product.picture
      fd.append 'product[title]',       $scope.product.title
      fd.append 'product[location]',    $scope.product.location
      fd.append 'product[user][email]', $scope.product.user.email

      # Custom $http POST to support file upload
      $http.post '/products.json', fd,
        withCredentials: true,
        headers: {'Content-Type': undefined },
        transformRequest: angular.identity
      .success ->
        $location.path '/products'
      .error ->
        console.log "ERROR"

    , ->
      console.log 'ERROR'