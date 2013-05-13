(function() {
  var App, testVar;

  console.log('help controller');

  testVar = 'hello';

  console.log('filter:capitalize');

  console.log('index controller changed: ' + Math.random());

  'use strict';

  App = angular.module('app', []);

  App.config([
    '$routeProvider', '$locationProvider', function($routeProvider, $locationProvider, config) {
      $routeProvider.when('/preview/:src', {
        templateUrl: '/partials/preview.html',
        controller: 'PreviewCtrl'
      }).when('/preview', {
        templateUrl: '/partials/preview.html',
        controller: 'PreviewCtrl'
      }).otherwise({
        redirectTo: '/preview'
      });
      return $locationProvider.html5Mode(false);
    }
  ]);

}).call(this);
