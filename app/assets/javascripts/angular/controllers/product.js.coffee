'use strict'

@app.controller 'ProductCtrl', ($scope, $routeParams, Product, User, NewProduct, $location) ->
  $scope.product  = Product.get
    id: $routeParams.id
  , ->
    $scope.user = User.get
      id: $scope.product.user_id

  $scope.$watch 'newProductImage', (newProductImage) ->
    if newProductImage?
      product = NewProduct.reset()
      product = NewProduct.get()
      product.picture = newProductImage

      $location.path '/products/new'

  $scope.prize = ->
    Math.floor(Math.random()*100)
