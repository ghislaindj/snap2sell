'use strict'

@app.controller 'NewProductCtrl', ($scope, NewProduct, Product, $http, $location) ->
  $scope.product = NewProduct.get()

  reader = new FileReader
  reader.onload = (event) ->
    $scope.productPictureUrl = event.target.result
    $scope.$apply()
  reader.readAsDataURL $scope.product.picture

  $scope.create = ->
    fd = new FormData
    fd.append 'product[picture]',  $scope.product.picture
    fd.append 'product[title]',    $scope.product.title

    # Custom $http POST to support file upload
    $http.post '/products.json', fd,
      withCredentials: true,
      headers: {'Content-Type': undefined },
      transformRequest: angular.identity
    .success ->
      $location.path '/products'
    .error ->
      console.log "ERROR"
