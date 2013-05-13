console.log 'index controller changed: ' + Math.random()
'use strict'

# Declare app level module which depends on filters, and services
App = angular.module('app', [
  'ngCookies'
  'ngResource'
  # 'HelpIndexCtrl'
  'app.controllers'

  # 'app.directives'
  # 'app.filters'
  # 'app.services'
])

App.config([
  '$routeProvider'
  '$locationProvider'

  ($routeProvider, $locationProvider, config) ->

    $routeProvider
      .when('/help', {templateUrl: '/partials/views/help/index.html',
      controller: 'HelpIndexCtrl'})

    # Catch all
      .otherwise({redirectTo: '/help'})

    # Without server side support html5 must be disabled.
    $locationProvider.html5Mode off
])
