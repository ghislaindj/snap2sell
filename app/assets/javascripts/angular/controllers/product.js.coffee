'use strict'

@app.controller 'ProductCtrl', ($scope, $routeParams, Product) ->
  $scope.product  = Product.get(id: $routeParams.id)
