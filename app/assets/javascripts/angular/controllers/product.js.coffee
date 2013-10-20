'use strict'

@app.controller 'ProductCtrl', ($scope, $routeParams, Product, User) ->
  $scope.product  = Product.get
    id: $routeParams.id
  , ->
    $scope.user = User.get
      id: $scope.product.user_id
