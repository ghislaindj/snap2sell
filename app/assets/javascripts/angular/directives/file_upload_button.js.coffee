@app.directive 'fileUploadButton', ->
  restrict: 'E'
  transclude: true
  replace:    true
  scope:
    file: '='
  templateUrl: '/assets/angular/templates/file_upload_button.html'

  link: (scope, element) ->
    file_element = angular.element('.file_element')

    file_element.bind 'change', (event) ->
      scope.$apply ->
        scope.file = event.target.files[0]

    scope.selectFile = ->
      file_element.click()
      null
