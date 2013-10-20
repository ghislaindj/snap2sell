@app.directive 'maryPopin', ->
  link: (scope, element) ->
    popin = [element.parent().find('.popin')[0]]
    $(element.find('.btnShare')).marypopin(popin)
