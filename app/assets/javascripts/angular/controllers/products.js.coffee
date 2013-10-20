'use strict'

@app.controller 'ProductsCtrl', ($rootScope, $scope, $location, Product, NewProduct) ->
  $scope.products = Product.index()

  $scope.$watch 'newProductImage', (newProductImage) ->
    if newProductImage?
      product = NewProduct.reset()
      product = NewProduct.get()
      product.picture = newProductImage

      $location.path '/products/new'
