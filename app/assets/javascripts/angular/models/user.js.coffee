@app.factory 'User', (railsResourceFactory, $resource) ->
  $resource '/users/:id.json', {}