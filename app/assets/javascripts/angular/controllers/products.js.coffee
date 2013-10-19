'use strict'

@app.controller 'ProductsCtrl', ($scope, Product) ->
  $scope.products = Product.index()
