'use strict'

@app.controller 'NewProductCtrl', ($scope, NewProduct, Product) ->
  $scope.product = NewProduct.get()
