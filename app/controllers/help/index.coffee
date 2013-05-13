'use strict'

### Controllers ###

angular.module('app.controllers')
.controller('HelpIndexCtrl', [
  '$scope'
  '$location'
  '$resource'
  '$rootScope'

($scope, $location, $resource, $rootScope) ->

  $scope.foo = 'bar'

])