'use strict'

@app.controller 'ProductsCtrl', ($rootScope, $scope, $location, Product, NewProduct) ->
  $scope.products = Product.index()

  $scope.$watch 'newProductImage', (newProductImage) ->
    if newProductImage?
      console.log newProductImage

      product = NewProduct.get()
      product.title = "MY TITLE"

      # reader = new FileReader
      # reader.onload = (event) ->
      #   product.picture = event.target.result
      #   $rootScope.$apply()
      # reader.readAsDataURL newProductImage
      product.picture = newProductImage

      $location.path '/products/new'
