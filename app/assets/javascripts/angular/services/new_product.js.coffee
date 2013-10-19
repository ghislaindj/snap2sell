'use strict'

@app.factory 'NewProduct', (Product) ->
  class NewProduct
    get: ->
      @product ||= {}

    reset: ->
      @product = null

  new NewProduct
