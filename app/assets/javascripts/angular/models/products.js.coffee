@app.factory 'Product', (railsResourceFactory, $resource) ->
  $resource '/products/:id.json', {},
    index:
      method: 'GET'
      isArray: true
