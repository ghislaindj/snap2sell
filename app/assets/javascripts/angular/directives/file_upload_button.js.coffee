@app.directive 'fileUploadButton', ->
  restrict: 'E'
  transclude: true
  replace:    true
  scope: {}
  template: "
  <div class='file_upload_button'>
    <button ng-click='selectFile()' ng-transclude></button>
    <div class='file_input_container'>
      <input class='file_element' type='file' />
    </div>
  </div>
  "

  link: (scope, element) ->
    scope.selectFile = ->
      angular.element('.file_element').click()
