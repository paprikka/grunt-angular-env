'use strict'

### Controllers ###
console.log 'app.controllers'
angular.module('app.controllers', []).controller('AppCtrl', [
  '$scope'
  '$rootScope'
  ($scope, $rootScope) ->
    $scope.test = 'ok'
    $scope.rootScopeVar = 'bar'
    console.log $scope.test
])