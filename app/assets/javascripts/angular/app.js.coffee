@app = angular.module 'app', []

@app.config ($routeProvider) ->
  $routeProvider
    .when '/products',
      templateUrl: 'views/products.html'
      controller: 'ProductsCtrl'
    .when '/products/:id',
      templateUrl: 'views/products.html'
      controller: 'ProdcutsCtrl'
    .otherwise
      redirectTo: '/products'

