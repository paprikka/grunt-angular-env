(function() {
  'use strict';
  /* Controllers
  */

  var App, testVar;

  angular.module('app.controllers', []).controller('AppCtrl', [
    '$scope', '$location', '$resource', '$rootScope', function($scope, $location, $resource, $rootScope) {
      $scope.$location = $location;
      $scope.$watch('$location.path()', function(path) {
        return $scope.activeNavId = path || '/';
      });
      return $scope.getClass = function(id) {
        if ($scope.activeNavId.substring(0, id.length) === id) {
          return 'active';
        } else {
          return '';
        }
      };
    }
  ]);

  'use strict';

  /* Controllers
  */


  angular.module('app.controllers').controller('HelpIndexCtrl', [
    '$scope', '$location', '$resource', '$rootScope', function($scope, $location, $resource, $rootScope) {
      return $scope.foo = 'bar';
    }
  ]);

  testVar = 'hello';

  console.log('filter:capitalize');

  console.log('index controller changed: ' + Math.random());

  'use strict';

  App = angular.module('app', ['ngCookies', 'ngResource', 'app.controllers']);

  App.config([
    '$routeProvider', '$locationProvider', function($routeProvider, $locationProvider, config) {
      $routeProvider.when('/help', {
        templateUrl: '/partials/views/help/index.html',
        controller: 'HelpIndexCtrl'
      }).otherwise({
        redirectTo: '/help'
      });
      return $locationProvider.html5Mode(false);
    }
  ]);

}).call(this);
